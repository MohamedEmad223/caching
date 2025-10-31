import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'ships_model.dart';

part 'query_ships_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class QueryShipsModel extends HiveObject {
  @HiveField(0)
  @JsonKey(name: "docs")
  List<ShipsModel>? ships;

  @HiveField(1)
  int? totalDocs;
  @HiveField(2)
  int? limit;
  @HiveField(3)
  int? totalPages;
  @HiveField(4)
  int? page;
  @HiveField(5)
  int? pagingCounter;
  @HiveField(6)
  bool? hasPrevPage;
  @HiveField(7)
  bool? hasNextPage;
  @HiveField(8)
  int? prevPage;
  @HiveField(9)
  int? nextPage;

  QueryShipsModel({
    required this.ships,
    required this.totalDocs,
    required this.limit,
    required this.totalPages,
    required this.page,
    required this.pagingCounter,
    required this.hasPrevPage,
    required this.hasNextPage,
    required this.prevPage,
    required this.nextPage,
  });

  factory QueryShipsModel.fromJson(Map<String, dynamic> json) => _$QueryShipsModelFromJson(json);
  Map<String, dynamic> toJson() => _$QueryShipsModelToJson(this);
}
