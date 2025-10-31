import 'package:film_app/core/di/dependancy_injection.dart';
import 'package:film_app/core/helper/cubit/theme_cubit.dart';
import 'package:film_app/core/helper/shared_pref_helper.dart';
import 'package:film_app/core/routes/app_routes.dart';
import 'package:film_app/core/routes/routes.dart';
import 'package:film_app/core/theme/theme_manager.dart';
import 'package:film_app/feature/home/data/local/home_cache_services.dart';
import 'package:film_app/feature/home/data/models/query_ships_model.dart';
import 'package:film_app/feature/home/data/models/ships_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await SharedPrefHelper.init();
  Hive.registerAdapter(ShipsModelAdapter());
  Hive.registerAdapter(QueryShipsModelAdapter());
  await HomeCacheService.init();
  await setupDependencyInjection();
  runApp(
    BlocProvider(
      create: (context) => ThemeCubit()..loadTheme(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final themeCubit = context.watch<ThemeCubit>();
          final isDark = themeCubit.isDark;
          return MaterialApp(
            darkTheme: ThemeManager.darkTheme,
            theme: ThemeManager.lightTheme,
            themeMode: (isDark ? ThemeMode.dark : ThemeMode.light),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.movieView,
            onGenerateRoute: AppRouter().generateRoute,
          );
        },
      ),
    );
  }
}
