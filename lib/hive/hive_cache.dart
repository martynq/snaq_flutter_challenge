import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:synchronized/synchronized.dart';

import 'hive_adapters.dart';
import 'key_value_cache.dart';

class HiveCache implements KeyValueCache {
  final Lock _initLock = Lock();
  HiveInterface? _lazyHiveInstance;

  Future<HiveInterface> get _hive async {
    await _initLock.synchronized(() async {
      if (_lazyHiveInstance == null) {
        var documentDir = await getApplicationDocumentsDirectory();

        HiveInterface result = Hive;
        result.init(documentDir.path);
        HiveAdapters.registerAdapters(result);
        _lazyHiveInstance = result;
      }
    });

    return _lazyHiveInstance!;
  }

  @override
  Future<void> write<T>(String table, String key, T value) async {
    var box = await _openHiveBox<T>(table);
    await box.put(key, value);
  }

  @override
  Future<void> writeAll<T>(String table, Map<String, T> entries) async {
    var box = await _openHiveBox<T>(table);
    await box.putAll(entries);
  }

  @override
  Future<T?> read<T>(String table, String key) async {
    var box = await _openHiveBox<T>(table);
    return box.get(key);
  }

  @override
  Future<Map<String, T>> readAll<T>(String table) async {
    var box = await _openHiveBox<T>(table);
    return box.toMap().cast<String, T>();
  }

  @override
  Future<void> deleteKey<T>(String table, String key) async {
    var box = await _openHiveBox<T>(table);
    await box.delete(key);
  }

  @override
  Future<void> deleteAllKeys<T>(String table) async {
    var box = await _openHiveBox<T>(table);
    await box.clear();
  }

  @override
  Future<void> close() async {
    await (await _hive).close();
  }

  Future<Box<T>> _openHiveBox<T>(String boxName) async {
    if (!(await _hive).isBoxOpen(boxName)) {
      return await (await _hive).openBox<T>(boxName);
    }
    return (await _hive).box<T>(boxName);
  }

  @override
  Future<void> deleteAllData(String boxName) async {
    final initHive = await _hive;
    await initHive.deleteBoxFromDisk(boxName);
  }
}
