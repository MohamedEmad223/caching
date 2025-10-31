import 'package:film_app/feature/home/data/models/ships_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieDetailsScreen extends StatelessWidget {
  final ShipsModel? ship;

  const MovieDetailsScreen({super.key, this.ship});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🚀 Ships'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(
                  imageUrl: ship?.image ?? '',
                  width: 200.w,
                  height: 250.h,
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
            ),
            SizedBox(height: 20.h),
            Text(
              ship?.shipName ?? '',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 20),
                SizedBox(width: 4.w),
                Text('${ship?.weightKg} kg', style: TextStyle(fontSize: 16.sp)),
                SizedBox(width: 10.w),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text(ship?.shipType ?? ''),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              'A computer programmer discovers that reality as he knows it is a simulation created by machines.',
              style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade800),
            ),
          ],
        ),
      ),
    );
  }
}
