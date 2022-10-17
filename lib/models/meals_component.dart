import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:snaq/hive/hive_adapters.dart';
import 'package:snaq/models/main_ingredient.dart';

part 'meals_component.g.dart';

@HiveType(
  typeId: HiveAdapters.adapterMealComponents,
  adapterName: 'MealComponentsAdapter',
)
@JsonSerializable()
class MealComponents {
  @HiveField(0)
  final MainIngredient? mainIngredient;
  @HiveField(1)
  final List<dynamic>? supplementaryIngredients;

  MealComponents({
    this.mainIngredient,
    this.supplementaryIngredients,
  });

  factory MealComponents.fromJson(Map<String, dynamic> json) =>
      _$MealComponentsFromJson(json);

  Map<String, dynamic> toJson() => _$MealComponentsToJson(this);
}
