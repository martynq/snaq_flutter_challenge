import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:snaq/hive/hive_adapters.dart';
import 'package:snaq/models/nutrition.dart';

part 'main_ingredient.g.dart';

@HiveType(
  typeId: HiveAdapters.adapterMainIngredient,
  adapterName: 'MainIngredientAdapter',
)
@JsonSerializable()
class MainIngredient {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final Nutrition? nutrition;

  MainIngredient({
    this.name,
    this.nutrition,
  });

  factory MainIngredient.fromJson(Map<String, dynamic> json) =>
      _$MainIngredientFromJson(json);

  Map<String, dynamic> toJson() => _$MainIngredientToJson(this);
}
