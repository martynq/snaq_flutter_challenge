import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snaq/features/meals/data/cubit/meals_state.dart';
import 'package:snaq/features/meals/data/image_provider.dart';
import 'package:snaq/hive/hive_cache.dart';
import 'package:snaq/hive/hive_keys.dart';
import 'package:snaq/models/meal.dart';
import 'package:snaq/models/meals_list.dart';
import 'package:snaq/services/food.dart';

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
      emit(MealsLoaded(mealsList.meals, [], []));
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
        emit(MealsLoaded(hiveMealsList, [], []));
      } else {
        emit(MealsFailure());
      }
    }
  }

  void addToFavouriteList(Meal meal) {
    if (!(state as MealsLoaded).favouriteMeals!.contains(meal)) {
      (state as MealsLoaded).favouriteMeals!.add(meal);
    }
    emit(
      MealsLoaded(
        (state as MealsLoaded).meals,
        (state as MealsLoaded).favouriteMeals,
        (state as MealsLoaded).dislikeMeals,
      ),
    );
  }

  void addToDislikeList(Meal meal) {
    if (!(state as MealsLoaded).dislikeMeals!.contains(meal)) {
      (state as MealsLoaded).dislikeMeals!.add(meal);
    }
    emit(
      MealsLoaded(
        (state as MealsLoaded).meals,
        (state as MealsLoaded).favouriteMeals,
        (state as MealsLoaded).dislikeMeals,
      ),
    );
  }
}
