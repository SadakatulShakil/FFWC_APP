import 'package:ffwc_app/Utills/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OtherFeatureCard extends StatelessWidget {
  final String icon;
  final String label;

  const OtherFeatureCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                icon,
              ),
              SizedBox(height: 8),
              Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700), textAlign: TextAlign.start),
            ],
          ),
        ),
      ),
    );
  }
}
