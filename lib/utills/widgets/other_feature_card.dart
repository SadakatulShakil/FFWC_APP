import 'package:ffwc_app/Utills/AppColors.dart';
import 'package:ffwc_app/pages/pdf_preview_page.dart';
import 'package:ffwc_app/pages/rainfall_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../pages/other_feature_details.dart';

class OtherFeatureCard extends StatelessWidget {
  final String icon;
  final String label;

  const OtherFeatureCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        label == 'forecast_bulletin'.tr
            ? Get.to(
                () => PDFPreviewPage(),
                transition: Transition.rightToLeft,
                duration: Duration(milliseconds: 300),
              )
            : label == 'rainfall_info'.tr
            ? Get.to(
                () => RainfallInformation(hasBackButton: true),
                transition: Transition.rightToLeft,
                duration: Duration(milliseconds: 300),
              )
            : label == 'inundation_map'.tr
            ? Get.to(
                () => InfoGraphicalView(hasBackButton: true),
                transition: Transition.rightToLeft,
                duration: Duration(milliseconds: 300),
              )
            : label == 'water_level_forecast'.tr
            ? Get.snackbar('Alert', 'This section is under development',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.red.withOpacity(0.8),
                colorText: Colors.white,
                duration: Duration(seconds: 2),
              )
            : Get.snackbar('Alert', 'This section is under development',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.red.withOpacity(0.8),
                colorText: Colors.white,
                duration: Duration(seconds: 2),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Container(
          width: 110.w,
          decoration: BoxDecoration(
            color: AppColors().app_secondary_bg,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  icon,
                  width: 40.w,
                  height: 40.h,
                ),
                SizedBox(height: 10.h),
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 14.sp,
                    letterSpacing: 0.3.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
