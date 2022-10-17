import 'package:snaq/models/meal.dart';

class FilteredListHelper {
  static bool? checkIfAddToFilteredList(
      List<String> ingredientsFiltered, Meal meal) {
    var listOfMealComponent = getTheListOfIngredients(meal);
    return isNotContaineFilteredIngredients(
        listOfMealComponent!, ingredientsFiltered);
  }

  static bool isNotContaineFilteredIngredients(List listOne, List listTwo) {
    return !listOne.toSet().intersection(listTwo.toSet()).isNotEmpty;
  }

  static List<String?>? getTheListOfIngredients(Meal meal) {
    var myCategory = meal.mealComponents
        ?.map((singleMeal) => singleMeal.mainIngredient?.name)
        .toList();
    myCategory?.removeWhere((item) => [""].contains(item));

    return myCategory;
  }

  static List<String>? getListOfEliminatedIngredients(List<Meal> meals) {
    var myCategory =
        meals.map((singleMeal) => singleMeal.mealComponents).toList();
    final list = List.of(myCategory)
        .map((e) => e!.map((e) => e.mainIngredient?.name ?? '').toList())
        .toList();
    var x = list.expand((x) => x).toSet().toList();
    x.removeWhere((item) => [""].contains(item));

    return x;
  }
}
