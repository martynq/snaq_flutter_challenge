// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealsAdapter extends TypeAdapter<Meals> {
  @override
  final int typeId = 2;

  @override
  Meals read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meals(
      id: fields[0] as String?,
      created: fields[1] as String?,
      image: fields[2] as String?,
      nutrition: fields[3] as Nutrition?,
      mealComponents: (fields[4] as List?)?.cast<MealComponents>(),
    );
  }

  @override
  void write(BinaryWriter writer, Meals obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.created)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.nutrition)
      ..writeByte(4)
      ..write(obj.mealComponents);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meals _$MealsFromJson(Map<String, dynamic> json) => Meals(
      id: json['id'] as String?,
      created: json['created'] as String?,
      image: json['image'] as String?,
      nutrition: json['nutrition'] == null
          ? null
          : Nutrition.fromJson(json['nutrition'] as Map<String, dynamic>),
      mealComponents: (json['mealComponents'] as List<dynamic>?)
          ?.map((e) => MealComponents.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealsToJson(Meals instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'image': instance.image,
      'nutrition': instance.nutrition,
      'mealComponents': instance.mealComponents,
    };
