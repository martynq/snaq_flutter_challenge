import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snaq/features/meals/data/cubit/meals_state.dart';
import 'package:snaq/features/meals/data/filtered_list_helper.dart';
import 'package:snaq/features/meals/data/image_provider.dart';
import 'package:snaq/hive/hive_cache.dart';
import 'package:snaq/hive/hive_keys.dart';
import 'package:snaq/models/meal.dart';
import 'package:snaq/models/meals_list.dart';
import 'package:snaq/services/meals.dart';

class MealsCubit extends Cubit<MealsState> {
  MealsCubit() : super(MealsInitial()) {
    fetchMeals();
  }

  final HiveCache hive = HiveCache();

  Future<void> fetchMeals() async {
    try {
      final MealsList mealsList = await FoodService().getFood();

      for (var element in mealsList.meals!) {
        final mealImage =
            await MealProvider().saveImage(element.id, element.image);
        element.image = mealImage;
      }
      if (mealsList.meals != null && mealsList.meals!.isNotEmpty) {
        for (var meals in mealsList.meals!) {
          await hive.write<Meal>(HiveKeys.meals, meals.id ?? '', meals);
        }
      }
      emit(MealsLoaded(
        mealsList.meals,
      ));
    } catch (_) {
      List<Meal>? hiveMealsList = [];
      await hive.readAll<Meal>(HiveKeys.meals).then(
            (value) => value.forEach(
              (key, meal) {
                hiveMealsList.add(meal);
              },
            ),
          );
      if (hiveMealsList.isNotEmpty) {
        emit(MealsLoaded(
          hiveMealsList,
        ));
      } else {
        emit(MealsFailure());
      }
    }
  }

  void addToFavouriteList(Meal meal) {
    if (!(state as MealsFiltered).favouriteMeals!.contains(meal)) {
      (state as MealsFiltered).favouriteMeals!.add(meal);
    }
    emit(
      MealsFiltered(
        (state as MealsFiltered).meals,
        (state as MealsFiltered).favouriteMeals,
        (state as MealsFiltered).dislikeMeals,
      ),
    );
  }

  void addToDislikeList(Meal meal) {
    if (!(state as MealsFiltered).dislikeMeals!.contains(meal)) {
      (state as MealsFiltered).dislikeMeals!.add(meal);
    }
    emit(
      MealsFiltered(
        (state as MealsFiltered).meals,
        (state as MealsFiltered).favouriteMeals,
        (state as MealsFiltered).dislikeMeals,
      ),
    );
  }

  void filterListBasedOnPreferences(String? ingredients) {
    var filteredList = (state as MealsLoaded).meals;
    for (var element in (state as MealsLoaded).meals!) {
      for (var component in element.mealComponents!) {
        component.mainIngredient!.name == ingredients;
        filteredList!.remove(element);
      }
    }
    emit(MealsLoaded(
      (state as MealsLoaded).meals,
    ));
  }

  void loadedState(List<String> ingredientsFiltered) async {
    List<Meal> filteredList = [];
    for (var x in (state as MealsLoaded).meals!) {
      if (FilteredListHelper.checkIfAddToFilteredList(ingredientsFiltered, x) ??
          false) {
        filteredList.add(x);
      }
    }
    emit(MealsFiltered(filteredList, [], []));
  }
}
