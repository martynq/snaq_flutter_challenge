// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealsListAdapter extends TypeAdapter<MealsList> {
  @override
  final int typeId = 1;

  @override
  MealsList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealsList(
      meals: (fields[0] as List?)?.cast<Meal>(),
    );
  }

  @override
  void write(BinaryWriter writer, MealsList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.meals);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealsListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsList _$MealsListFromJson(Map<String, dynamic> json) => MealsList(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealsListToJson(MealsList instance) => <String, dynamic>{
      'meals': instance.meals,
    };
