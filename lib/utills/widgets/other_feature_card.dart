import 'package:ffwc_app/Utills/AppColors.dart';
import 'package:ffwc_app/pages/pdf_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OtherFeatureCard extends StatelessWidget {
  final String icon;
  final String label;

  const OtherFeatureCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       Get.to(() => PDFViewerPage(),
         transition: Transition.rightToLeft,
         duration: Duration(milliseconds: 500),
       );
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            color: AppColors().app_secondary_bg,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color:
              AppColors().app_secondary_bg,
                  blurRadius: 4,
                  offset: Offset(2, 2))
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 12.0, right: 14.0, top: 10.0, bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  icon,
                ),
                SizedBox(height: 10),
                Text(label, style: TextStyle(fontSize: 12,
                    fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
