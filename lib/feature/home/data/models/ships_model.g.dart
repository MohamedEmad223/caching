// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ships_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShipsModelAdapter extends TypeAdapter<ShipsModel> {
  @override
  final int typeId = 1;

  @override
  ShipsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShipsModel(
      shipId: fields[0] as String?,
      shipName: fields[1] as String?,
      shipType: fields[2] as String?,
      active: fields[3] as bool?,
      image: fields[8] as String?,
      homePort: fields[6] as String?,
      link: fields[7] as String?,
      weightKg: fields[4] as int?,
      yearBuilt: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ShipsModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.shipId)
      ..writeByte(1)
      ..write(obj.shipName)
      ..writeByte(2)
      ..write(obj.shipType)
      ..writeByte(3)
      ..write(obj.active)
      ..writeByte(4)
      ..write(obj.weightKg)
      ..writeByte(5)
      ..write(obj.yearBuilt)
      ..writeByte(6)
      ..write(obj.homePort)
      ..writeByte(7)
      ..write(obj.link)
      ..writeByte(8)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShipsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipsModel _$ShipsModelFromJson(Map<String, dynamic> json) => ShipsModel(
      shipId: json['id'] as String?,
      shipName: json['name'] as String?,
      shipType: json['type'] as String?,
      active: json['active'] as bool?,
      image: json['image'] as String?,
      homePort: json['home_port'] as String?,
      link: json['link'] as String?,
      weightKg: (json['mass_kg'] as num?)?.toInt(),
      yearBuilt: (json['year_built'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShipsModelToJson(ShipsModel instance) =>
    <String, dynamic>{
      'id': instance.shipId,
      'name': instance.shipName,
      'type': instance.shipType,
      'active': instance.active,
      'mass_kg': instance.weightKg,
      'year_built': instance.yearBuilt,
      'home_port': instance.homePort,
      'link': instance.link,
      'image': instance.image,
    };
