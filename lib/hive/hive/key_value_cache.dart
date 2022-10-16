/// Allows CRUD operations:
/// - on individual items, identifiable by their String key
/// - on sets of items, using maps with String keys
abstract class KeyValueCache {
  /// CRUD: Create + Update ONE
  Future<void> write<T>(String table, String key, T value);

  /// CRUD: Create + Update ALL
  Future<void> writeAll<T>(String table, Map<String, T> entries);

  /// CRUD: Read ONE
  Future<T?> read<T>(String table, String key);

  /// CRUD: Read ALL
  Future<Map<String, T>> readAll<T>(String table);

  /// CRUD: Delete ONE
  Future<void> deleteKey<T>(String table, String key);

  /// CRUD: Delete ALL
  Future<void> deleteAllKeys<T>(String table);

  Future<void> deleteAllData(String table);

  /// Lifecycle
  Future<void> close();
}
