// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ships_model.dart';

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
