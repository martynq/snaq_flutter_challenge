import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:snaq/hive/hive/hive_adapters.dart';
import 'package:snaq/models/abbreviation.dart';

part 'nutrients_detail.g.dart';

@HiveType(
  typeId: HiveAdapters.adapterNutrientsDetail,
  adapterName: 'NutrientsDetailAdapter',
)
@JsonSerializable()
class NutrientsDetail {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? unit;
  @HiveField(2)
  final double? value;
  @HiveField(3)
  final double? valueWithPrecision;
  @HiveField(4)
  final Abbreviation? abbreviation;

  NutrientsDetail({
    this.name,
    this.unit,
    this.value,
    this.valueWithPrecision,
    this.abbreviation,
  });

  factory NutrientsDetail.fromJson(Map<String, dynamic> json) =>
      _$NutrientsDetailFromJson(json);

  Map<String, dynamic> toJson() => _$NutrientsDetailToJson(this);
}
