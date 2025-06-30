import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

import '../controllers/dashboard/dashboard_controller.dart';
import '../utills/widgets/alert_widget.dart';
import '../utills/widgets/other_feature_section.dart';
import '../utills/widgets/station_feature_section.dart';
import 'dashboard2.dart';

class DashboardPage extends StatefulWidget{
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Obx(() => SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                ///Background gif or image for animation
                Container(
                  padding: EdgeInsets.fromLTRB(16, 35, 16, 16),
                  height: 225.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/gif/background.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),
                      /// Location Info
                      GestureDetector(
                        onTap: () {
                          Get.to(() => DashboardPage2());
                        },
                        child: Row(
                          children: [
                            Text(
                              "মিরপুর ডিওএইচএস, ঢাকা, বাংলাদেশ",
                              style: TextStyle(
                                fontFamily: 'NotoSansBengali',
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(Icons.keyboard_arrow_down_sharp,
                                color: Colors.white, size: 20.r),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      /// Temperature + Weather Info Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Temperature with degree symbol
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: controller.weatherData[0].temperature,
                                  style: TextStyle(
                                    fontFamily: 'NotoSansBengali',
                                    fontSize: 64.sp,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: '°C',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansBengali',
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // High/Low and Weather Icon Column
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset('assets/images/weather_icon.png', width: 70.w, height: 70.h),
                              SizedBox(height: 4.h),
                              Text(
                                'আংশিক মেঘলা',
                                style: TextStyle(
                                    fontFamily: 'NotoSansBengali',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: Colors.white),
                              ),
                            ],

                          ),
                        ],
                      ),
                      /// bottom Small Details in weather data
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "৩৬° সেলসিয়াস মনে হচ্ছে",
                            style: TextStyle(
                              fontFamily: 'NotoSansBengali',
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            height: 16.h,
                            width: 1.w,
                            color: Colors.cyan,
                          ),
                          SizedBox(width: 5.w),
                          Icon(Icons.arrow_drop_up_outlined, color: Colors.orange, size: 20.r),
                          Text(
                            "৪১°C",
                            style: TextStyle(
                              fontFamily: 'NotoSansBengali',
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Icon(Icons.arrow_drop_down, color: Colors.teal, size: 22.r),
                          Text(
                            "২৪°C",
                            style: TextStyle(
                              fontFamily: 'NotoSansBengali',
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            height: 16.h,
                            width: 1.w,
                            color: Colors.cyan,
                          ),
                          SizedBox(width: 12.w),
                          Icon(Icons.water_outlined, color: Colors.blue, size: 20.r),
                          SizedBox(width: 8.w),
                          Text(
                            "৩১%",
                            style: TextStyle(
                              fontFamily: 'NotoSansBengali',
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      /// bottom Small Details in weather data
                    ],
                  ),
                ),
                /// Curved section and List of content
                Positioned(
                  top: 205.h,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.r),
                      topLeft: Radius.circular(25.r),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25.r),
                          topLeft: Radius.circular(25.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.r,
                            offset: Offset(0, 2.h),
                          ),
                        ],
                      ),
                      child: ListView(
                        padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 0.w),
                        children: [
                          // Station Features
                          ...controller.station_features.map((feature) => StationFeatureWidget(
                            title: feature.title,
                            items: feature.items,
                          )),

                          SizedBox(height: 5.h),

                          Container(
                            height: 50.h,
                            color: const Color(0xFFFFEFF0),
                            child: Marquee(
                              text:
                              '🚨 বন্যা সতর্কতা: (২৩ জুন ২০২৫) তিস্তা, ধরলা ও দুধকুমার নদীসমূহের পানি আগামী ০২ দিন বৃদ্ধি পেতে পারে এবং আগামী ৪৮ ঘণ্টায় তিস্তা নদীর পানি সতর্কসীমায় (বিপদসীমার কাছাকাছি) প্রবাহিত হতে পারে। ✦✦ বিস্তারিত পূর্বাভাসের জন্য দৈনিক প্রতিবেদন দেখুন।',
                              style: TextStyle(
                                fontFamily: 'NotoSansBengali',
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                                fontSize: 16.sp,
                              ),
                              scrollAxis: Axis.horizontal,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              blankSpace: 20.0.w,
                              velocity: 100.0,
                              pauseAfterRound: const Duration(seconds: 1),
                              startPadding: 5.0.w,
                              accelerationDuration: const Duration(seconds: 1),
                              accelerationCurve: Curves.linear,
                              decelerationDuration: const Duration(milliseconds: 500),
                              decelerationCurve: Curves.easeOut,
                            ),
                          ),

                          ...controller.other_features.map((feature) => OtherFeatureSectionWidget(
                            title: feature.title,
                            items: feature.items,
                          )),

                          SizedBox(height: 8.h),

                          ...controller.alert_features.map((feature) => AlertWidget(
                            items: feature.items,
                          )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ))
      ),
    );
  }
}