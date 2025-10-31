// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_ships_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QueryShipsModelAdapter extends TypeAdapter<QueryShipsModel> {
  @override
  final int typeId = 0;

  @override
  QueryShipsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QueryShipsModel(
      ships: (fields[0] as List?)?.cast<ShipsModel>(),
      totalDocs: fields[1] as int?,
      limit: fields[2] as int?,
      totalPages: fields[3] as int?,
      page: fields[4] as int?,
      pagingCounter: fields[5] as int?,
      hasPrevPage: fields[6] as bool?,
      hasNextPage: fields[7] as bool?,
      prevPage: fields[8] as int?,
      nextPage: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, QueryShipsModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.ships)
      ..writeByte(1)
      ..write(obj.totalDocs)
      ..writeByte(2)
      ..write(obj.limit)
      ..writeByte(3)
      ..write(obj.totalPages)
      ..writeByte(4)
      ..write(obj.page)
      ..writeByte(5)
      ..write(obj.pagingCounter)
      ..writeByte(6)
      ..write(obj.hasPrevPage)
      ..writeByte(7)
      ..write(obj.hasNextPage)
      ..writeByte(8)
      ..write(obj.prevPage)
      ..writeByte(9)
      ..write(obj.nextPage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QueryShipsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryShipsModel _$QueryShipsModelFromJson(Map<String, dynamic> json) =>
    QueryShipsModel(
      ships: (json['docs'] as List<dynamic>?)
          ?.map((e) => ShipsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDocs: (json['totalDocs'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      pagingCounter: (json['pagingCounter'] as num?)?.toInt(),
      hasPrevPage: json['hasPrevPage'] as bool?,
      hasNextPage: json['hasNextPage'] as bool?,
      prevPage: (json['prevPage'] as num?)?.toInt(),
      nextPage: (json['nextPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QueryShipsModelToJson(QueryShipsModel instance) =>
    <String, dynamic>{
      'docs': instance.ships,
      'totalDocs': instance.totalDocs,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
      'page': instance.page,
      'pagingCounter': instance.pagingCounter,
      'hasPrevPage': instance.hasPrevPage,
      'hasNextPage': instance.hasNextPage,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
    };
