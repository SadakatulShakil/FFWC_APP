import 'package:ffwc_app/models/alertFeatureModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'alert_feature_card.dart';

class AlertWidget extends StatelessWidget {
  final List<AlertItemModel> items;

  const AlertWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 4.r, offset: Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h,),
          SizedBox(
            height: 250.h,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              itemCount: items.length,
              separatorBuilder: (_, __) => SizedBox(width: 8.w),
              itemBuilder: (context, i) {
                return AlertFeatureCard(
                  type: items[i].type,
                  icon: items[i].icon,
                  label: items[i].label,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}