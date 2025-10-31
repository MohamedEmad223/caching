import 'package:json_annotation/json_annotation.dart';

part 'ships_model.g.dart';

@JsonSerializable()
class ShipsModel {
  @JsonKey(name: 'id')
  String? shipId;
  @JsonKey(name: 'name')
  String? shipName;
  @JsonKey(name: 'type')
  String? shipType;
  bool? active;
  @JsonKey(name: 'mass_kg')
  int? weightKg;
  @JsonKey(name: 'year_built')
  int? yearBuilt;
  @JsonKey(name: 'home_port')
  String? homePort;
  String? link;
  String? image;

  ShipsModel(
      {this.shipId,
      this.shipName,
      this.shipType,
      this.active,
      this.image,
      this.homePort,
      this.link,
      this.weightKg,
      this.yearBuilt});

  factory ShipsModel.fromjson(Map<String, dynamic> json) =>
      _$ShipsModelFromJson(json);

  Map<String, dynamic> tojson() => _$ShipsModelToJson(this);
}