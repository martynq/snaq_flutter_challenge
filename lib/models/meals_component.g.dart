// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_component.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealComponentsAdapter extends TypeAdapter<MealComponents> {
  @override
  final int typeId = 5;

  @override
  MealComponents read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealComponents(
      mainIngredient: fields[0] as MainIngredient?,
      supplementaryIngredients: (fields[1] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, MealComponents obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.mainIngredient)
      ..writeByte(1)
      ..write(obj.supplementaryIngredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealComponentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealComponents _$MealComponentsFromJson(Map<String, dynamic> json) =>
    MealComponents(
      mainIngredient: json['mainIngredient'] == null
          ? null
          : MainIngredient.fromJson(
              json['mainIngredient'] as Map<String, dynamic>),
      supplementaryIngredients:
          json['supplementaryIngredients'] as List<dynamic>?,
    );

Map<String, dynamic> _$MealComponentsToJson(MealComponents instance) =>
    <String, dynamic>{
      'mainIngredient': instance.mainIngredient,
      'supplementaryIngredients': instance.supplementaryIngredients,
    };
