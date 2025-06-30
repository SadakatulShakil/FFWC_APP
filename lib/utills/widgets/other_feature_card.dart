import 'package:ffwc_app/Utills/AppColors.dart';
import 'package:ffwc_app/pages/pdf_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../pages/feature_details.dart';

class OtherFeatureCard extends StatelessWidget {
  final String icon;
  final String label;

  const OtherFeatureCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
              () => InfoGraphicalView(),
          transition: Transition.rightToLeft,
          duration: Duration(milliseconds: 300),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Container(
          width: 110.w,
          decoration: BoxDecoration(
            color: AppColors().app_secondary_bg,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: AppColors().app_secondary_bg,
                blurRadius: 4.r,
                offset: Offset(2, 2),
              ),
            ],
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
