// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abbreviation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AbbreviationAdapter extends TypeAdapter<Abbreviation> {
  @override
  final int typeId = 7;

  @override
  Abbreviation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Abbreviation(
      unit: fields[0] as String?,
      nutrient: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Abbreviation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.unit)
      ..writeByte(1)
      ..write(obj.nutrient);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AbbreviationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Abbreviation _$AbbreviationFromJson(Map<String, dynamic> json) => Abbreviation(
      unit: json['unit'] as String?,
      nutrient: json['nutrient'] as String?,
    );

Map<String, dynamic> _$AbbreviationToJson(Abbreviation instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'nutrient': instance.nutrient,
    };
