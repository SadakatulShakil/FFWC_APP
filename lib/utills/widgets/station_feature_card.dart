import 'package:ffwc_app/pages/station_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StationFeatureCard extends StatelessWidget {
  final String title;
  final String value;
  final String label;

  const StationFeatureCard({
    required this.title,
    required this.value,
    required this.label,
  });

  String getBackgroundSvg() {
    if (title.contains("severe_flood".tr)) return 'assets/svg/severe.svg';
    if (title.contains("flood".tr)) return 'assets/svg/flood.svg';
    if (title.contains("warning".tr)) return 'assets/svg/warning.svg';
    return 'assets/svg/normal.svg';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => StationInformation(
          title: title,
          value: value,
          label: label,
        ));
      },
      child: Container(
        width: 146.w,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: SvgPicture.asset(
                getBackgroundSvg(),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 56.sp,
                      fontWeight: FontWeight.w800,
                      color: title.contains("severe_flood".tr)
                          ? Colors.pinkAccent.shade400
                          : title.contains("flood".tr)
                          ? Colors.red.shade400
                          : title.contains("warning".tr)
                          ? Colors.orange.shade400
                          : Colors.green.shade400,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    label,
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
