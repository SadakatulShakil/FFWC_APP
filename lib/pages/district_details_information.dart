import 'package:ffwc_app/controllers/station/water_level_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Utills/AppColors.dart';
import '../controllers/dashboard/dashboard_controller.dart';
import '../controllers/settings/settings_controller.dart';
import '../utills/widgets/alert_widget.dart';

class DistrictDetailsInformation extends StatefulWidget {
  final String districtName;
  final String categoryName;
  const DistrictDetailsInformation({super.key, required this.districtName, required this.categoryName});
  @override
  State<DistrictDetailsInformation> createState() => _DistrictDetailsInformationState();
}

class _DistrictDetailsInformationState extends State<DistrictDetailsInformation> {
  final WaterLevelController controller = Get.put(WaterLevelController());
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              ///Background gradiant for appbar
              Container(
                padding: EdgeInsets.fromLTRB(10.w, 30.h, 16.w, 16.h),
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1B8CBE), Color(0xFF09228F)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Padding(
                            padding: EdgeInsets.all(10.0.r),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0.h, bottom: 8.0.h),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'স্টেশনের বর্তমান অবস্থা',
                                style: TextStyle(
                                  fontFamily: 'NotoSansBengali',
                                  letterSpacing: 0.3.sp,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ),

              /// Curved section and List of content
              Positioned(
                top: 100.h,
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
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.r),
                        topLeft: Radius.circular(25.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.r,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListView(
                      padding: EdgeInsets.all(8.0.r),
                      children: [
                        ListTile(
                          leading: Text(
                            '${widget.districtName.split(' (')[0]} স্টেশনের বিবরণ',
                            style: TextStyle(
                              fontFamily: 'NotoSansBengali',
                              letterSpacing: 0.3.sp,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          trailing: Container(
                            decoration: BoxDecoration(
                              color: widget.categoryName == 'সতর্কতা' ? Colors.orange.withOpacity(0.2) :
                              widget.categoryName == 'বন্যা' ? Colors.red.withOpacity(0.2) :
                              widget.categoryName == 'তীব্র বন্যা' ? Colors.pink.withOpacity(0.2) :
                              Colors.grey,
                              borderRadius: BorderRadius.circular(21.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 3.r,
                                  spreadRadius: 1.r,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                              child: Text(
                                widget.categoryName,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'NotoSansBengali',
                                  fontWeight: FontWeight.w600,
                                  color: widget.categoryName == 'সতর্কতা'
                                      ? Colors.orange
                                      : widget.categoryName == 'বন্যা'
                                      ? Colors.red
                                      : widget.categoryName == 'তীব্র বন্যা'
                                      ? Colors.pink
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height -150,
                              child: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(25.7519564000377, 89.2575465497694),
                                  zoom: 15,
                                ),
//markers: controller.markers.toSet(),
                                onMapCreated: controller.initializeMap,
                                mapType: MapType.normal,
                                myLocationEnabled: true,
                                compassEnabled: true,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('স্টেশনের নাম: পাটেশ্বরী',
                                        style: TextStyle(
                                          color: AppColors().app_primary,
                                          fontSize: 16.sp,
                                          fontFamily: 'NotoSansBengali',
                                          fontWeight: FontWeight.w700,
                                        ),),
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
                                              text: 'সুরমা  ',
                                              style: TextStyle(
                                                color: AppColors().app_primary,
                                                fontSize: 14.sp,
                                                fontFamily: 'NotoSansBengali',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(text: 'উপজেলা: '),
                                            TextSpan(
                                              text: 'চিলমানি  ',
                                              style: TextStyle(
                                                color: AppColors().app_primary,
                                                fontSize: 14.sp,
                                                fontFamily: 'NotoSansBengali',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(text: 'বিপদের মাত্রা: '),
                                            TextSpan(
                                              text: '১৯.৮ mMSL ',
                                              style: TextStyle(
                                                color: AppColors().app_primary,
                                                fontSize: 14.sp,
                                                fontFamily: 'NotoSansBengali',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(text: 'পানির স্তর: ',),
                                            TextSpan(
                                              text: '১০.৫৩ mMSL (০৩-জুন-২০২৫)\n',
                                              style: TextStyle(
                                                color: AppColors().app_primary,
                                                fontSize: 14.sp,
                                                fontFamily: 'NotoSansBengali',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(text: 'গত 3 ঘন্টা: '),
                                            TextSpan(
                                              text: 'উদীয়মান ',
                                              style: TextStyle(
                                                color: AppColors().app_primary,
                                                fontSize: 14.sp,
                                                fontFamily: 'NotoSansBengali',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(text: ' গত ২৪ ঘন্টায়: '),
                                            TextSpan(text: ' উত্থান/পতন: ',),
                                            TextSpan(
                                              text: ' +২.০ সেমি}',
                                              style: TextStyle(color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('স্টেশনের নাম: পাটেশ্বরী',
                                        style: TextStyle(
                                          color: AppColors().app_primary,
                                          fontSize: 16.sp,
                                          fontFamily: 'NotoSansBengali',
                                          fontWeight: FontWeight.w700,
                                        ),),
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
                                              text: 'সুরমা  ',
                                              style: TextStyle(
                                                color: AppColors().app_primary,
                                                fontSize: 14.sp,
                                                fontFamily: 'NotoSansBengali',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(text: 'উপজেলা: '),
                                            TextSpan(
                                              text: 'চিলমানি  ',
                                              style: TextStyle(
                                                color: AppColors().app_primary,
                                                fontSize: 14.sp,
                                                fontFamily: 'NotoSansBengali',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(text: 'বিপদের মাত্রা: '),
                                            TextSpan(
                                              text: '১৯.৮ mMSL ',
                                              style: TextStyle(
                                                color: AppColors().app_primary,
                                                fontSize: 14.sp,
                                                fontFamily: 'NotoSansBengali',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(text: 'পানির স্তর: ',),
                                            TextSpan(
                                              text: '১০.৫৩ mMSL (০৩-জুন-২০২৫)\n',
                                              style: TextStyle(
                                                color: AppColors().app_primary,
                                                fontSize: 14.sp,
                                                fontFamily: 'NotoSansBengali',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(text: 'গত 3 ঘন্টা: '),
                                            TextSpan(
                                              text: 'উদীয়মান ',
                                              style: TextStyle(
                                                color: AppColors().app_primary,
                                                fontSize: 14.sp,
                                                fontFamily: 'NotoSansBengali',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(text: ' গত ২৪ ঘন্টায়: '),
                                            TextSpan(text: ' উত্থান/পতন: ',),
                                            TextSpan(
                                              text: ' +২.০ সেমি}',
                                              style: TextStyle(color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.red.shade50,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 100,
                                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade100,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                        ),
                                      ),
                                      child: Image.asset(
                                        'assets/icons/danger_alert.png',
                                        width: 40,
                                        height: 40,
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
                            ],
                          ),
                        )

                      ],
                    ),
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


