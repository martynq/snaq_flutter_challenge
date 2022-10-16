import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:snaq/hive/hive_adapters.dart';
import 'package:snaq/models/meal.dart';

part 'meals_list.g.dart';

@HiveType(
  typeId: HiveAdapters.adapterMealsList,
  adapterName: 'MealsListAdapter',
)
@JsonSerializable()
class MealsList {
  @HiveField(0)
  final List<Meal>? meals;

  MealsList({
    this.meals,
  });

  factory MealsList.fromJson(Map<String, dynamic> json) =>
      _$MealsListFromJson(json);

  Map<String, dynamic> toJson() => _$MealsListToJson(this);
}
