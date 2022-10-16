import 'package:snaq/models/meals.dart';

abstract class MealsState {}

class MealsInitial extends MealsState {}

class MealsFailure extends MealsState {}

class MealsLoaded extends MealsState {
  final List<Meals>? meals;
  final List<Meals>? favouriteMeals;
  final List<Meals>? dislikeMeals;

  MealsLoaded(this.meals, this.favouriteMeals, this.dislikeMeals);
}
