import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ships_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1) // خلي typeId مختلف عن QueryShipsModel
class ShipsModel extends HiveObject {
  @HiveField(0)
  @JsonKey(name: 'id')
  String? shipId;

  @HiveField(1)
  @JsonKey(name: 'name')
  String? shipName;

  @HiveField(2)
  @JsonKey(name: 'type')
  String? shipType;

  @HiveField(3)
  bool? active;

  @HiveField(4)
  @JsonKey(name: 'mass_kg')
  int? weightKg;

  @HiveField(5)
  @JsonKey(name: 'year_built')
  int? yearBuilt;

  @HiveField(6)
  @JsonKey(name: 'home_port')
  String? homePort;

  @HiveField(7)
  String? link;

  @HiveField(8)
  String? image;

  ShipsModel({
    this.shipId,
    this.shipName,
    this.shipType,
    this.active,
    this.image,
    this.homePort,
    this.link,
    this.weightKg,
    this.yearBuilt,
  });

  factory ShipsModel.fromJson(Map<String, dynamic> json) => _$ShipsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipsModelToJson(this);
}
