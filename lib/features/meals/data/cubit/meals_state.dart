import 'package:snaq/models/meal.dart';

abstract class MealsState {}

class MealsInitial extends MealsState {}

class MealsFailure extends MealsState {}

class MealsLoaded extends MealsState {
  final List<Meal>? meals;
  final List<Meal>? favouriteMeals;
  final List<Meal>? dislikeMeals;

  MealsLoaded(this.meals, this.favouriteMeals, this.dislikeMeals);
}
