import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:film_app/core/networking/api_error_handler.dart';
import 'package:film_app/core/networking/api_services.dart';
import 'package:film_app/feature/home/data/local/home_cache_services.dart';
import 'package:film_app/feature/home/data/models/query_ships_model.dart';

class ShipsRepo {
  final ApiServices _apiServices;
  final HomeCacheService _cacheService;
  ShipsRepo(this._apiServices, this._cacheService);

  Future<Either<ApiErrorHandler, QueryShipsModel>> fetchAllShips(
    String path, {
    required int page,
  }) async {
    try {
      final ships = await _apiServices.fetchAllShips({
        'options': {'page': page, 'limit': 10},
      });
      _cacheService.cacheItem('ships_page_$page', ships);

      log('repo success=> $ships');
      return Right(ships);
    } catch (e) {
      log('repo error=> $e');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
