import 'package:film_app/core/helper/cubit/theme_cubit.dart';
import 'package:film_app/core/networking/api_constatnt.dart';
import 'package:film_app/feature/home/data/cubit/cubit/ships_cubit.dart';
import 'package:film_app/feature/home/presentation/widgets/load_more.dart';
import 'package:film_app/feature/home/presentation/widgets/ships_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry/sentry.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();
    final shipsCubit = context.read<ShipsCubit>();
    shipsCubit.fetchAllShips(ApiConstants.queryShips);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final themeCubit = context.watch<ThemeCubit>();

    final shipsCubit = context.watch<ShipsCubit>();

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[850] : Colors.purple[50],
      appBar: AppBar(
        title: Text(
          '🚀 Ships',
          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
        ),
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.purple[50],
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => themeCubit.toggleTheme(),
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode_outlined,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: BlocBuilder<ShipsCubit, ShipsState>(
        builder: (context, state) {
          if (state is ShipsLoading && shipsCubit.allShips.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ShipsFailure) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is ShipsSuccess ||
              shipsCubit.allShips.isNotEmpty ||
              state is NoMoreShips ||
              state is LoadingMoreShips) {
            return Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                children: [
                  Expanded(child: ShipsListView()),
                  SizedBox(height: 12.h),
                  if (state is LoadingMoreShips)
                    const Center(child: CircularProgressIndicator())
                  else if (state is NoMoreShips)
                    Text(
                      'No more ships to load 🚫',
                      style: TextStyle(
                        color: isDarkMode ? Colors.white60 : Colors.black54,
                      ),
                    )
                  else
                    ElevatedButton(
                      onPressed: () {
                        shipsCubit.fetchAllShips(ApiConstants.queryShips);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? Colors.grey[800]
                            : Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        minimumSize: Size(double.infinity, 48.h),
                      ),
                      child: LoadMore(isDarkMode: isDarkMode),
                    ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }


}
