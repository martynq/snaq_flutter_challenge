import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:snaq/hive/hive/hive_adapters.dart';
import 'package:snaq/models/nutrients_detail.dart';

part 'nutrition.g.dart';

@HiveType(
  typeId: HiveAdapters.adapterNutrition,
  adapterName: 'NutritionAdapter',
)
@JsonSerializable()
class Nutrition {
  @HiveField(0)
  final NutrientsDetail? carbohydrates;
  @HiveField(1)
  final NutrientsDetail? fatTotal;
  @HiveField(2)
  final NutrientsDetail? protein;
  @HiveField(3)
  final NutrientsDetail? energy;

  Nutrition({
    this.carbohydrates,
    this.fatTotal,
    this.protein,
    this.energy,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) =>
      _$NutritionFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionToJson(this);
}
