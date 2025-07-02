import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utills/widgets/station_info_graphical_view.dart';
import '../utills/widgets/station_info_list_view.dart';

class StationInformation extends StatefulWidget {
  final int tabIndex;
  final String heading;
  final String title;
  final String value;
  final String label;

  StationInformation({
    super.key,
    this.tabIndex = 0,
    required this.heading,
    required this.title,
    required this.value,
    required this.label,
  });

  @override
  State<StationInformation> createState() => _StationInformationState();
}

class _StationInformationState extends State<StationInformation> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: widget.tabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              /// AppBar background
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
                        child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20.sp),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.heading,
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
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'NotoSansBengali',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF00E5CA),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 12.h, right: 8.w),
                      child: Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF00E5CA), size: 18.sp),
                    ),
                  ],
                ),
              ),

              /// Tab section
              Positioned(
                top: 100.h,
                left: 0,
                right: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.r),
                    topLeft: Radius.circular(16.r),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.r),
                        topLeft: Radius.circular(16.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.r,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.h),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'last_update_news'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'NotoSansBengali',
                              letterSpacing: 0.3.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue.shade900,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.r),
                                topRight: Radius.circular(12.r),
                              ),
                            ),
                            child: TabBar(
                              controller: _tabController,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFF5AAFE5), Color(0xFF3B8DD2)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.r),
                                  topRight: Radius.circular(12.r),
                                ),
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.white70,
                              tabs: [
                                Tab(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.map, size: 20.sp),
                                      SizedBox(width: 8.w),
                                      Text(
                                        "map_view".tr,
                                        style: TextStyle(
                                          fontFamily: 'NotoSansBengali',
                                          letterSpacing: 0.3.sp,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Tab(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.format_list_bulleted, size: 20.sp),
                                      SizedBox(width: 8.w),
                                      Text(
                                        "list_view".tr,
                                        style: TextStyle(
                                          fontFamily: 'NotoSansBengali',
                                          letterSpacing: 0.3.sp,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Expanded(
                            child: TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              controller: _tabController,
                              children: [
                                Center(child: StationInfoGraphicalView()),
                                Center(child: StationInfoListView()),
                              ],
                            ),
                          ),
                        ],
                      ),
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
