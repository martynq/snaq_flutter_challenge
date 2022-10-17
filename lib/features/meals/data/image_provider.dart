import 'package:snaq/features/meals/data/image_helper.dart';

class MealProvider {
  Future<String> saveImage(String? id, String? image) async {
    String imageMeal = '';

    if (image != null) {
      imageMeal = await ImageHelper.downloadImage(
        "meal$id",
        image,
      );
    }
    return imageMeal;
  }
}
