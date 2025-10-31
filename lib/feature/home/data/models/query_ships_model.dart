import 'package:json_annotation/json_annotation.dart';

import 'ships_model.dart';

part 'query_ships_model.g.dart';

@JsonSerializable()
class QueryShipsModel {
  @JsonKey(name: "docs")
  List<ShipsModel>? ships;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  int? prevPage;
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

  factory QueryShipsModel.fromJson(Map<String, dynamic> json) =>
      _$QueryShipsModelFromJson(json);
}