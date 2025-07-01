import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RainfallInfoWidget extends StatelessWidget {
  final List<Map<String, String>> rainfallData = [
    {'date': '২৫-০৬-২০২৫', 'rainfall': '22'},
    {'date': '২৫-০৬-২০২৫', 'rainfall': '০৩'},
    {'date': '২৫-০৬-২০২৫', 'rainfall': '০৩'},
    {'date': '২৫-০৬-২০২৫', 'rainfall': '০০'},
    {'date': '২৫-০৬-২০২৫', 'rainfall': '৫৮'},
  ];

  final List<FlSpot> rainfallSpots = [
    FlSpot(0, 0),
    FlSpot(1, 50),
    FlSpot(2, 100),
    FlSpot(3, 150),
    FlSpot(4, 160),
    FlSpot(5, 60),
  ];

  final List<String> xLabels = ['১৮/০৬', '১৯/০৬', '২০/০৬', '২১/০৬', '২২/০৬', '২৩/০৬'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      margin: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Color(0xFFEFF8FF),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Station Info
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 14.sp, fontFamily: 'NotoSansBengali', color: Colors.black),
              children: [
                TextSpan(text: 'স্টেশনের নাম: ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'পাটেশ্বরী\n'),
                TextSpan(text: 'বেসিনের নাম: ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'ব্রহ্মপুত্র    '),
                TextSpan(text: 'বার্ষিক গড়বর্ষণ(মি.মি): ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: '৫৪০'),
              ],
            ),
          ),

          SizedBox(height: 16.h),

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

          SizedBox(height: 16.h),

          /// Chart Title
          Center(
            child: Text('সর্বশেষ বৃষ্টিপাতের গ্রাফ',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, fontFamily: 'NotoSansBengali')),
          ),

          SizedBox(height: 12.h),

          /// Line Chart
          SizedBox(
            height: 180.h,
            child: LineChart(
              LineChartData(
                borderData: FlBorderData(show: true),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, _) {
                        int index = value.toInt();
                        return Text(xLabels[index],
                            style: TextStyle(fontSize: 10.sp, fontFamily: 'NotoSansBengali'));
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true),
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
        ],
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
