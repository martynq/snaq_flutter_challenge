import 'package:hive/hive.dart';
import 'package:snaq/models/abbreviation.dart';
import 'package:snaq/models/main_ingredient.dart';
import 'package:snaq/models/meal.dart';
import 'package:snaq/models/meals_component.dart';
import 'package:snaq/models/meals_list.dart';
import 'package:snaq/models/nutrients_detail.dart';
import 'package:snaq/models/nutrition.dart';

class HiveAdapters {
  static const int adapterMealsList = 1;
  static const int adapterMeal = 2;
  static const int adapterNutrition = 3;
  static const int adapterNutrientsDetail = 4;
  static const int adapterMealComponents = 5;
  static const int adapterMainIngredient = 6;
  static const int adapterAbbreviation = 7;

  static registerAdapters(HiveInterface hive) {
    // ignore: invalid_use_of_visible_for_testing_member
    hive.resetAdapters();
    if (!hive.isAdapterRegistered(0)) {
      hive.registerAdapter(MealsListAdapter());
      hive.registerAdapter(MealAdapter());
      hive.registerAdapter(NutritionAdapter());
      hive.registerAdapter(NutrientsDetailAdapter());
      hive.registerAdapter(MealComponentsAdapter());
      hive.registerAdapter(MainIngredientAdapter());
      hive.registerAdapter(AbbreviationAdapter());
    }
  }
}
