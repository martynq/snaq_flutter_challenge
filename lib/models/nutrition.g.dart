// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NutritionAdapter extends TypeAdapter<Nutrition> {
  @override
  final int typeId = 3;

  @override
  Nutrition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Nutrition(
      carbohydrates: fields[0] as NutrientsDetail?,
      fatTotal: fields[1] as NutrientsDetail?,
      protein: fields[2] as NutrientsDetail?,
      energy: fields[3] as NutrientsDetail?,
    );
  }

  @override
  void write(BinaryWriter writer, Nutrition obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.carbohydrates)
      ..writeByte(1)
      ..write(obj.fatTotal)
      ..writeByte(2)
      ..write(obj.protein)
      ..writeByte(3)
      ..write(obj.energy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutritionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nutrition _$NutritionFromJson(Map<String, dynamic> json) => Nutrition(
      carbohydrates: json['carbohydrates'] == null
          ? null
          : NutrientsDetail.fromJson(
              json['carbohydrates'] as Map<String, dynamic>),
      fatTotal: json['fatTotal'] == null
          ? null
          : NutrientsDetail.fromJson(json['fatTotal'] as Map<String, dynamic>),
      protein: json['protein'] == null
          ? null
          : NutrientsDetail.fromJson(json['protein'] as Map<String, dynamic>),
      energy: json['energy'] == null
          ? null
          : NutrientsDetail.fromJson(json['energy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NutritionToJson(Nutrition instance) => <String, dynamic>{
      'carbohydrates': instance.carbohydrates,
      'fatTotal': instance.fatTotal,
      'protein': instance.protein,
      'energy': instance.energy,
    };
