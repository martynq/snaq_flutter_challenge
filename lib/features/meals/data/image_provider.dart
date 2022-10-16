import 'package:snaq/features/meals/data/image_helper.dart';
import 'package:snaq/models/meals.dart';

class MealProvider {
  Future<String> saveImage(Meals meal) async {
    String imageMeal = '';

    if (meal.image != null) {
      imageMeal = await ImageHelper.downloadImage(
        "meal${meal.id}",
        meal.image ?? '',
        meal.id ?? '',
      );
    }
    return imageMeal;
  }
}
