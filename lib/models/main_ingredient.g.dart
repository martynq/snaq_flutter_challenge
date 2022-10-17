// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_ingredient.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainIngredientAdapter extends TypeAdapter<MainIngredient> {
  @override
  final int typeId = 6;

  @override
  MainIngredient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainIngredient(
      name: fields[0] as String?,
      nutrition: fields[1] as Nutrition?,
    );
  }

  @override
  void write(BinaryWriter writer, MainIngredient obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.nutrition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainIngredientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainIngredient _$MainIngredientFromJson(Map<String, dynamic> json) =>
    MainIngredient(
      name: json['name'] as String?,
      nutrition: json['nutrition'] == null
          ? null
          : Nutrition.fromJson(json['nutrition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainIngredientToJson(MainIngredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nutrition': instance.nutrition,
    };
