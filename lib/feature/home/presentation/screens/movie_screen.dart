import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_app/core/helper/cubit/theme_cubit.dart';
import 'package:film_app/core/utils/color_theme_extension.dart';
import 'package:film_app/feature/home/data/cubit/cubit/ships_cubit.dart';
import 'package:film_app/feature/home/presentation/screens/movie_dfetalis_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    shipsCubit.fetchAllShips("ships/query");
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    final isDark = themeCubit.isDark;
    final colors = Theme.of(context).extension<ColorThemeExtension>()!;
    final shipsCubit = context.watch<ShipsCubit>();

    return Scaffold(
      backgroundColor: colors.bgColor,
      appBar: AppBar(
        title: Text(
          '🚀 Ships',
          style: TextStyle(color: colors.toolbarTextColor),
        ),
        backgroundColor: colors.bgToolbarColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => themeCubit.changeThemeMode(),
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode_outlined,
              color: colors.toolbarTextColor,
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
                  Expanded(
                    child: ListView.separated(
                      itemCount: shipsCubit.allShips.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final ship = shipsCubit.allShips[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MovieDetailsScreen(ship: ship),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color:
                                  isDark ? Colors.grey[850] : Colors.purple[50],
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: CachedNetworkImage(
                                    imageUrl: ship.image ?? '',
                                    width: 80.w,
                                    height: 100.h,
                                    fit: BoxFit.cover,
                                    placeholder: (_, __) => Container(
                                      color: Colors.grey[300],
                                      child:
                                          const Icon(Icons.image_not_supported),
                                    ),
                                    errorWidget: (_, __, ___) => Container(
                                      color: Colors.grey[300],
                                      child:
                                          const Icon(Icons.image_not_supported),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ship.shipName ?? '',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: isDark
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 6.h),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 18,
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            ship.shipType ?? '',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: isDark
                                                  ? Colors.white70
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.arrow_forward_ios, size: 18),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 12.h),
                  if (state is LoadingMoreShips)
                    const Center(child: CircularProgressIndicator())
                  else if (state is NoMoreShips)
                    Text(
                      'No more ships to load 🚫',
                      style: TextStyle(
                        color: isDark ? Colors.white60 : Colors.black54,
                      ),
                    )
                  else
                    ElevatedButton(
                      onPressed: () {
                        shipsCubit.fetchAllShips("ships/query");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isDark ? Colors.grey[800] : Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        minimumSize: Size(double.infinity, 48.h),
                      ),
                      child: Text(
                        'Load More Movies',
                        style: TextStyle(
                          color: isDark
                              ? Colors.white70
                              : Colors.grey.shade700,
                        ),
                      ),
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
