import 'package:snaq/models/meal.dart';

abstract class MealsState {}

class MealsInitial extends MealsState {}

class MealsFailure extends MealsState {}

class MealsFiltered extends MealsState {
  final List<Meal>? meals;
  final List<Meal>? favouriteMeals;
  final List<Meal>? dislikeMeals;

  MealsFiltered(this.meals, this.favouriteMeals, this.dislikeMeals);
}

class MealsLoaded extends MealsState {
  final List<Meal>? meals;

  MealsLoaded(
    this.meals,
  );
}
