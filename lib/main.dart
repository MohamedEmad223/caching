import 'package:film_app/core/di/dependancy_injection.dart';
import 'package:film_app/core/helper/cubit/theme_cubit.dart';
import 'package:film_app/core/helper/shared_pref_helper.dart';
import 'package:film_app/core/routes/app_routes.dart';
import 'package:film_app/core/routes/routes.dart';
import 'package:film_app/core/theme/theme_manager.dart';
import 'package:film_app/feature/home/data/local/home_cache_services.dart';
import 'package:film_app/feature/home/data/models/query_ships_model.dart';
import 'package:film_app/feature/home/data/models/ships_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.platformDispatcher.onMetricsChanged;
  await Hive.initFlutter();
  await SharedPrefHelper.init();
  Hive.registerAdapter(ShipsModelAdapter());
  Hive.registerAdapter(QueryShipsModelAdapter());
  await HomeCacheService.init();
  await setupDependencyInjection();
  if(kReleaseMode){
    await SentryFlutter.init((options) {
    options.dsn =
        'https://5798cd7de875c409a6a784239eed8e2d@o4510286710046720.ingest.us.sentry.io/4510286717452288';
    options.sendDefaultPii = true;
    options.tracesSampleRate = 1.0;
    options.profilesSampleRate = 1.0;
    options.attachStacktrace = true;
    options.attachScreenshot = true;
    options.attachViewHierarchy = true;
    options.attachViewHierarchy = true;
  });
  }else{
    runApp(
    BlocProvider(
      create: (context) => ThemeCubit(getIt<SharedPreferences>()),
      child: SentryWidget(child: const MyApp()),
    ),
  );
  }
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            darkTheme: ThemeManager.getDarkTheme(),
            theme: ThemeManager.getLightTheme(),
            themeMode: state,
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.movieView,
            onGenerateRoute: AppRouter().generateRoute,
          );
        },
      ),
    );
  }
}
