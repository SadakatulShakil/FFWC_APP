import 'package:ffwc_app/models/other_features_item_model.dart';
import 'package:ffwc_app/utills/widgets/other_feature_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherFeatureSectionWidget extends StatelessWidget {
  final String title;
  final List<OtherFeaturesItemModel> items;

  const OtherFeatureSectionWidget({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 20.h),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'NotoSansBengali',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45,
                  letterSpacing: 0.3.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.w, top: 20.h),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: Colors.cyan,
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        SizedBox(
          height: 125.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            itemCount: items.length,
            separatorBuilder: (_, __) => SizedBox(width: 10.w),
            itemBuilder: (context, i) {
              return OtherFeatureCard(
                icon: items[i].icon,
                label: items[i].label,
              );
            },
          ),
        ),
      ],
    );
  }
}
