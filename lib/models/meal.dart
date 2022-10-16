import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:snaq/hive/hive_adapters.dart';
import 'package:snaq/models/meals_component.dart';
import 'package:snaq/models/nutrition.dart';

part 'meal.g.dart';

@HiveType(
  typeId: HiveAdapters.adapterMeal,
  adapterName: 'MealAdapter',
)
@JsonSerializable()
class Meal {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? created;
  @HiveField(2)
  String? image;
  @HiveField(3)
  final Nutrition? nutrition;
  @HiveField(4)
  final List<MealComponents>? mealComponents;

  Meal({
    this.id,
    this.created,
    this.image,
    this.nutrition,
    this.mealComponents,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);
}
