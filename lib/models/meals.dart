import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:snaq/hive/hive/hive_adapters.dart';
import 'package:snaq/models/meals_component.dart';
import 'package:snaq/models/nutrition.dart';

part 'meals.g.dart';

@HiveType(
  typeId: HiveAdapters.adapterMeals,
  adapterName: 'MealsAdapter',
)
@JsonSerializable()
class Meals {
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

  Meals({
    this.id,
    this.created,
    this.image,
    this.nutrition,
    this.mealComponents,
  });

  factory Meals.fromJson(Map<String, dynamic> json) => _$MealsFromJson(json);

  Map<String, dynamic> toJson() => _$MealsToJson(this);
}
