import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_app/feature/home/data/cubit/cubit/ships_cubit.dart';
import 'package:film_app/feature/home/presentation/screens/movie_detalis_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShipsListView extends StatelessWidget {
  const ShipsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final shipsCubit = context.watch<ShipsCubit>();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ListView.separated(
      itemCount: shipsCubit.allShips.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final ship = shipsCubit.allShips[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => MovieDetailsScreen(ship: ship)),
            );
          },
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey[850] : Colors.purple[50],
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
                      child: const Icon(Icons.image_not_supported),
                    ),
                    errorWidget: (_, __, ___) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ship.shipName ?? '',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          const Icon(
                            Icons.shield_sharp,
                            color: Colors.orange,
                            size: 18,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            ship.shipType ?? '',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: isDarkMode ? Colors.white70 : Colors.black,
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
    );
  }
}
