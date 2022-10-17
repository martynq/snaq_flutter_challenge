import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:snaq/hive/hive_adapters.dart';

part 'abbreviation.g.dart';

@HiveType(
  typeId: HiveAdapters.adapterAbbreviation,
  adapterName: 'AbbreviationAdapter',
)
@JsonSerializable()
class Abbreviation {
  @HiveField(0)
  final String? unit;
  @HiveField(1)
  final String? nutrient;

  Abbreviation({
    this.unit,
    this.nutrient,
  });

  factory Abbreviation.fromJson(Map<String, dynamic> json) =>
      _$AbbreviationFromJson(json);

  Map<String, dynamic> toJson() => _$AbbreviationToJson(this);
}
