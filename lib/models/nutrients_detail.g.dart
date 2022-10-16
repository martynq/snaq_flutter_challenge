// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrients_detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NutrientsDetailAdapter extends TypeAdapter<NutrientsDetail> {
  @override
  final int typeId = 4;

  @override
  NutrientsDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NutrientsDetail(
      name: fields[0] as String?,
      unit: fields[1] as String?,
      value: fields[2] as double?,
      valueWithPrecision: fields[3] as double?,
      abbreviation: fields[4] as Abbreviation?,
    );
  }

  @override
  void write(BinaryWriter writer, NutrientsDetail obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.unit)
      ..writeByte(2)
      ..write(obj.value)
      ..writeByte(3)
      ..write(obj.valueWithPrecision)
      ..writeByte(4)
      ..write(obj.abbreviation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutrientsDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutrientsDetail _$NutrientsDetailFromJson(Map<String, dynamic> json) =>
    NutrientsDetail(
      name: json['name'] as String?,
      unit: json['unit'] as String?,
      value: (json['value'] as num?)?.toDouble(),
      valueWithPrecision: (json['valueWithPrecision'] as num?)?.toDouble(),
      abbreviation: json['abbreviation'] == null
          ? null
          : Abbreviation.fromJson(json['abbreviation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NutrientsDetailToJson(NutrientsDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'unit': instance.unit,
      'value': instance.value,
      'valueWithPrecision': instance.valueWithPrecision,
      'abbreviation': instance.abbreviation,
    };
