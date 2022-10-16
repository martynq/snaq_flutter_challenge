import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class ImageHelper {
  static Future<String> downloadImage(
    String name,
    String imageUrl,
  ) async {
    final filename = Uri.parse(imageUrl).pathSegments.last;

    final dir = (await getApplicationDocumentsDirectory()).path;

    final path = '$dir/$name/$filename';
    if (File(path).existsSync()) {
      return path;
    } else {
      try {
        await Dio().download(imageUrl, path);
      } on DioError catch (e) {
        print(e);
      }
    }
    return path;
  }
}
