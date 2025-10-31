import 'package:dio/dio.dart';
import 'package:film_app/core/networking/api_constatnt.dart';
import 'package:film_app/feature/home/data/models/query_ships_model.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';


@RestApi(baseUrl:ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio,{String? baseUrl}) = _ApiServices;
 @POST(ApiConstants.queryShips)
  Future<QueryShipsModel> fetchAllShips(@Body() body);
 
}
abstract class ParseErrorLogger {
  void logError(Object error, StackTrace stackTrace, dynamic options);
}
