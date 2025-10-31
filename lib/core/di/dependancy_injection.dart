import 'package:dio/dio.dart';
import 'package:film_app/core/networking/api_services.dart';
import 'package:film_app/core/networking/dio_factory.dart';
import 'package:film_app/feature/home/data/local/home_cache_services.dart';
import 'package:film_app/feature/home/data/repo/ship_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

  getIt.registerLazySingleton<ApiServices>(() => ApiServices(getIt<Dio>()));

  getIt.registerLazySingleton<HomeCacheService>(() => HomeCacheService());

  getIt.registerLazySingleton<ShipsRepo>(
    () => ShipsRepo(getIt<ApiServices>(), getIt<HomeCacheService>()),
  );
}
