import 'package:film_app/core/di/dependancy_injection.dart';
import 'package:film_app/core/routes/routes.dart';
import 'package:film_app/feature/home/data/cubit/cubit/ships_cubit.dart';
import 'package:film_app/feature/home/data/repo/ship_repo.dart';
import 'package:film_app/feature/home/presentation/screens/movie_detalis_screen.dart';
import 'package:film_app/feature/home/presentation/screens/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.movieView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ShipsCubit(
              getIt<ShipsRepo>(),
            ),
            child: MoviesScreen(),
          ),
        );
      case Routes.detailsView:
        return MaterialPageRoute(builder: (_) => MovieDetailsScreen());
      default:
        return null;
    }
  }
}
