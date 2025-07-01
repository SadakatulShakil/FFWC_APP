import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Utills/AppColors.dart';

class RainfallInformation extends StatefulWidget {
  @override
  State<RainfallInformation> createState() => _RainfallInformationState();
}

class _RainfallInformationState extends State<RainfallInformation> {
  //final WaterLevelController controller = Get.put(WaterLevelController());
  final List<Map<String, String>> rainfallData = [
    {'date': '২৫-০৬-২০২৫', 'rainfall': '22'},
    {'date': '২৫-০৬-২০২৫', 'rainfall': '০৩'},
    {'date': '২৫-০৬-২০২৫', 'rainfall': '০৩'},
    {'date': '২৫-০৬-২০২৫', 'rainfall': '০০'},
    {'date': '২৫-০৬-২০২৫', 'rainfall': '৫৮'},
  ];

  final List<FlSpot> rainfallSpots = [
    FlSpot(0, 0),
    FlSpot(1, 25),
    FlSpot(2, 27),
    FlSpot(3, 245),
    FlSpot(4, 20),
    FlSpot(5, 25),
    FlSpot(6, 160),
    FlSpot(7, 70),
  ];

  final List<String> xLabels = ['১৮/০৬', '১৯/০৬', '২০/০৬', '২১/০৬', '২২/০৬', '২৩/০৬', '২৪/০৬', '২৫/০৬', '২৬/০৬'];

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
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'বৃষ্টিপাতের তথ্য',
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
                ),
              ),
              Positioned(
                top: 110.h,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.r),
                    topLeft: Radius.circular(25.r),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 60.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(12.w, 16.h, 12.w, 6.h),
                            child: TextField(
                              // controller: controller.textController,
                              // onChanged: controller.updateSearch,
                              // onSubmitted: controller.updateSearch,
                              textInputAction: TextInputAction.search,
                              decoration: InputDecoration(
                                hintText: 'স্টেশন অনুসারে অনুসন্ধান করুন',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.sp,
                                  fontFamily: 'NotoSansBengali',
                                  fontWeight: FontWeight.w400,
                                ),
                                label: Text('স্টেশন অনুসারে অনুসন্ধান করুন'),
                                labelStyle: TextStyle(
                                  color: AppColors().app_primary,
                                  fontSize: 14.sp,
                                  fontFamily: 'NotoSansBengali',
                                  fontWeight: FontWeight.w400,
                                ),
                                suffixIcon: Icon(Icons.search, size: 22.sp),
                                suffixIconColor: AppColors().app_primary,
                                contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.r),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Station Info
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(12.r),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE4F7FF),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12.r),
                                      topRight: Radius.circular(12.r),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.r),
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(fontSize: 16.sp, fontFamily: 'NotoSansBengali', color: Colors.black),
                                        children: [
                                          TextSpan(text: 'স্টেশনের নাম: ',
                                              style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18.sp,
                                            fontFamily: 'NotoSansBengali',
                                            color: AppColors().app_primary
                                          )),
                                          TextSpan(text: 'পাটেশ্বরী\n', style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18.sp,
                                              fontFamily: 'NotoSansBengali',
                                              color: AppColors().app_primary
                                          )),
                                          TextSpan(text: 'নদীর নাম: ', style: TextStyle(fontWeight: FontWeight.w400)),
                                          TextSpan(text: 'ব্রহ্মপুত্র    ', style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'NotoSansBengali',
                                              color: AppColors().app_primary)),
                                          TextSpan(text: 'বার্ষিক গড়বর্ষণ(মি.মি): ', style: TextStyle(fontWeight: FontWeight.w400)),
                                          TextSpan(text: '৫৪০', style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'NotoSansBengali',
                                              color: AppColors().app_primary)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(16.r),
                                  width: double.infinity,
                                  color: Color(0xFFF0FAFF),
                                  child: Column(
                                    children: [
                                      /// Table Title
                                      Center(
                                        child: Text('সর্বশেষ বৃষ্টিপাতের অবস্থা',
                                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, fontFamily: 'NotoSansBengali'),
                                        ),
                                      ),

                                      SizedBox(height: 10.h),

                                      /// Table
                                      Table(
                                        border: TableBorder.all(color: Colors.blue.shade100),
                                        children: [
                                          TableRow(
                                            decoration: BoxDecoration(color: Colors.lightBlue.shade100),
                                            children: [
                                              _buildTableCell('তারিখ', true),
                                              _buildTableCell('বৃষ্টিপাত (মি.মি)', true),
                                            ],
                                          ),
                                          ...rainfallData.map((data) {
                                            return TableRow(children: [
                                              _buildTableCell(data['date']!),
                                              _buildTableCell(data['rainfall']!),
                                            ]);
                                          }).toList(),
                                        ],
                                      ),

                                      SizedBox(height: 12.h),

                                      /// Button
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.lightBlue.shade100,
                                            foregroundColor: Colors.blue,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                                          ),
                                          child: Text('আরও দেখুন', style: TextStyle(fontSize: 14.sp, fontFamily: 'NotoSansBengali')),
                                        ),
                                      ),

                                      SizedBox(height: 32.h),

                                      /// Chart Title
                                      Center(
                                        child: Text('সর্বশেষ বৃষ্টিপাতের গ্রাফ',
                                            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, fontFamily: 'NotoSansBengali')),
                                      ),

                                      SizedBox(height: 32.h),

                                      /// Line Chart
                                      SizedBox(
                                        height: 250.h,
                                        child: LineChart(
                                          LineChartData(
                                            minY: 0,
                                            maxY: 250,
                                            gridData: FlGridData(
                                              show: true,
                                              horizontalInterval: 50,
                                              drawVerticalLine: false,
                                            ),
                                            borderData: FlBorderData(
                                              show: true,
                                              border: const Border(
                                                left: BorderSide(color: Colors.black26),
                                                bottom: BorderSide(color: Colors.black26),
                                              ),
                                            ),
                                            titlesData: FlTitlesData(
                                              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                              leftTitles: AxisTitles(
                                                sideTitles: SideTitles(
                                                  showTitles: true,
                                                  interval: 50,
                                                  getTitlesWidget: (value, _) => Text(
                                                    value.toInt().toString(),
                                                    style: TextStyle(fontSize: 10.sp),
                                                  ),
                                                  reservedSize: 35.w,
                                                ),
                                              ),
                                              bottomTitles: AxisTitles(
                                                sideTitles: SideTitles(
                                                  showTitles: true,
                                                  interval: 1,
                                                  getTitlesWidget: (value, _) {
                                                    int index = value.toInt();
                                                    return Padding(
                                                      padding: EdgeInsets.only(top: 4.h),
                                                      child: Text(
                                                        index < xLabels.length ? xLabels[index] : '',
                                                        style: TextStyle(fontSize: 10.sp, fontFamily: 'NotoSansBengali'),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            lineBarsData: [
                                              LineChartBarData(
                                                spots: rainfallSpots,
                                                isCurved: true,
                                                color: Colors.blue,
                                                barWidth: 2,
                                                belowBarData: BarAreaData(show: false),
                                                dotData: FlDotData(show: true),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 32.h),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
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

  Widget _buildTableCell(String text, [bool isHeader = false]) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            fontFamily: 'NotoSansBengali',
          ),
        ),
      ),
    );
  }
}
