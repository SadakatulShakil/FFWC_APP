import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertFeatureCard extends StatelessWidget {
  final String type;
  final String icon;
  final String label;

  const AlertFeatureCard({required this.type, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        /// navigate to a new page or show a dialog
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
        child: Container(
          height: 100.h,
          decoration: BoxDecoration(
            color: type == 'danger'
                ? Colors.red.shade50
                : type == 'info'
                ? Colors.blue.shade50
                : type == 'medium'
                ? Colors.yellow.shade50
                : Colors.green.shade50,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4.r)],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100.h,
                padding:  EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                decoration: BoxDecoration(
                  color: type == 'danger'
                      ? Colors.red.shade100
                      : type == 'info'
                      ? Colors.blue.shade100
                      : type == 'medium'
                      ? Colors.yellow.shade100
                      : Colors.green.shade100,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    bottomLeft: Radius.circular(12.r),
                  ),
                ),
                child: Image.asset(
                  icon,
                  width: 40.w,
                  height: 40.h,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 16.sp, color: Colors.black), // Default style
                          children: [
                            TextSpan(text: '(22 June 2025) The ',
                              style: TextStyle(
                                fontFamily: 'NotoSansBengali',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'সারিগোয়াইন নদী',
                              style: TextStyle(
                                fontFamily: 'NotoSansBengali',
                                color: Colors.red[700], // River color
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(text: ' সিলেট জেলার,  ',
                              style: TextStyle(
                                fontFamily: 'NotoSansBengali',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'যাদুকাটা নদী',
                              style: TextStyle(
                                fontFamily: 'NotoSansBengali',
                                color: Colors.red[700], // River color
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(text: ' সুনামগঞ্জ জেলার ',
                              style: TextStyle(
                                fontFamily: 'NotoSansBengali',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'সোমেশ্বরী নদী',
                              style: TextStyle(
                                fontFamily: 'NotoSansBengali',
                                color: Colors.red[700], // River color
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(text: ' নেত্রকোণার ',
                              style: TextStyle(
                                fontFamily: 'NotoSansBengali',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'আরও দেখুন...',
                              style: TextStyle(
                                fontFamily: 'NotoSansBengali',
                                color: Colors.blue, // "View More" color
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
