import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/station/water_level_controller.dart';
import 'district_details_information.dart';

class InfoGraphicalView extends StatelessWidget {
  final bool hasBackButton;
  InfoGraphicalView({Key? key, required this.hasBackButton}) : super(key: key);
  final WaterLevelController controller = Get.put(WaterLevelController());

  Color _getTextColor(int index) {
    final colors = [Colors.orange, Colors.red, Colors.pink, Colors.teal, Colors.indigo];
    return colors[index % colors.length];
  }

  Color _getBackgroundColor(int index) {
    return _getTextColor(index).withOpacity(0.3);
  }

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
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 50.h, 16.w, 16.h),
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1B8CBE), Color(0xFF09228F)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: EdgeInsets.all(10.r),
                        child: hasBackButton? Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20.sp,
                        ): SizedBox.shrink(),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
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
                    Padding(
                      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'পর্যবেক্ষণ',
                          style: TextStyle(
                            fontFamily: 'NotoSansBengali',
                            fontSize: 16.sp,
                            letterSpacing: 0.3.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF00E5CA),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 12.h, right: 8.w),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF00E5CA),
                        size: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 100.h,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.r),
                    topLeft: Radius.circular(25.r),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 12.h),
                          child: Text(
                            'সর্বশেষ আপডেট: রবিবার ২৪ জুন, ২০২৫ রাত ৯.০০ টা',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'NotoSansBengali',
                              letterSpacing: 0.3.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue.shade900,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Obx(() => Row(
                            children: controller.stationCategories.map((category) {
                              int index = controller.stationCategories.indexOf(category);
                              return Expanded(
                                child: _buildTab(
                                  category.categoryName,
                                  _getTextColor(index),
                                  _getBackgroundColor(index),
                                  index,
                                  controller,
                                ),
                              );
                            }).toList(),
                          )),
                        ),
                        Obx(() => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height - 150.h,
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: controller.bangladeshCenter,
                                zoom: controller.zoomLevel.value,
                              ),
                              markers: controller.markers.toSet(),
                              onMapCreated: controller.initializeMap,
                              mapType: MapType.normal,
                              myLocationEnabled: true,
                              compassEnabled: true,
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 200.h,
                left: 5.w,
                right: 5.w,
                child: Obx(() => controller.showingDistricts.value
                    ? Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                    child: Wrap(
                    spacing: 8.w,
                    runSpacing: 6.h,
                    children: controller.visibleDistricts
                        .map((data) => GestureDetector(
                      onTap: () {
                        final district = data['district']!;
                        final category = data['category']!;
                        Get.to(() => DistrictDetailsInformation(
                          districtName: district,
                          categoryName: category,
                        ));
                      },
                      child: Chip(
                        label: Text(
                          data['district']!,
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'NotoSansBengali',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                        backgroundColor: Colors.blue.shade50,
                      ),
                    ))
                        .toList(),
                  ),
                )
                    : SizedBox.shrink()),
              ),
              Positioned(
                bottom: 20.h,
                left: 10.w,
                child: Row(
                  children: [
                    Image.asset('assets/images/logo.png', height: 65.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Flood Forecasting And Warning Center',
                            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
                        Text('Bangladesh Water Development Board',
                            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title, Color textColor, Color backColor, int index, WaterLevelController ctrl) {
    return GestureDetector(
      onTap: () {
        if (ctrl.activeTab.value == index && ctrl.showingDistricts.value) {
          ctrl.hideDistricts();
        } else {
          ctrl.showCategoryDistricts(title);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.only(
            topLeft: index == 0 ? Radius.circular(12.r) : Radius.zero,
            topRight: index == ctrl.stationCategories.length - 1 ? Radius.circular(12.r) : Radius.zero,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            SizedBox(width: 4.w),
            Obx(() => Text(
              "(${ctrl.categoryCounts[title] ?? 0})",
              style: TextStyle(
                fontFamily: 'NotoSansBengali',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
