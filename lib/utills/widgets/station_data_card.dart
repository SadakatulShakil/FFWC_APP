import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utills/AppColors.dart';
import '../../models/station_data_model.dart';

class StationCard extends StatelessWidget {
  final StationDataModel station;

  StationCard({required this.station});

  @override
  Widget build(BuildContext context) {
    final statusColor = station.status.contains('উত্তরণশীল')
        ? Colors.red
        : station.status.contains('নিম্নমুখী')
        ? Colors.green
        : Colors.black;

    return Container(
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'স্টেশনের নাম: ${station.name}',
            style: TextStyle(
              color: AppColors().app_primary,
              fontSize: 16.sp,
              fontFamily: 'NotoSansBengali',
              fontWeight: FontWeight.w700,
            ),
          ),
          Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
              children: [
                TextSpan(text: 'নদীর নাম: '),
                TextSpan(
                  text: '${station.riverName}  ',
                  style: TextStyle(
                    color: AppColors().app_primary,
                    fontSize: 14.sp,
                    fontFamily: 'NotoSansBengali',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: 'উপজেলা: '),
                TextSpan(
                  text: '${station.upazila}  ',
                  style: TextStyle(
                    color: AppColors().app_primary,
                    fontSize: 14.sp,
                    fontFamily: 'NotoSansBengali',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: 'বিপদের মাত্রা: '),
                TextSpan(
                  text: '${station.dangerLevel} ',
                  style: TextStyle(
                    color: AppColors().app_primary,
                    fontSize: 14.sp,
                    fontFamily: 'NotoSansBengali',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: 'পানির স্তর: '),
                TextSpan(
                  text: '${station.currentLevel}\n',
                  style: TextStyle(
                    color: AppColors().app_primary,
                    fontSize: 14.sp,
                    fontFamily: 'NotoSansBengali',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: 'গত 3 ঘন্টা: '),
                TextSpan(
                  text: '${station.status} ',
                  style: TextStyle(
                    color: AppColors().app_primary,
                    fontSize: 14.sp,
                    fontFamily: 'NotoSansBengali',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: ' (${station.date})'),
                TextSpan(text: ' উত্থান/পতন: '),
                TextSpan(
                  text: ' ${station.change}',
                  style: TextStyle(color: statusColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
