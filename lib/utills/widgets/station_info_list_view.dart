import 'package:ffwc_app/Utills/AppColors.dart';
import 'package:ffwc_app/utills/widgets/station_data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/station/station_condition_controller.dart';

class StationInfoListView extends StatelessWidget {
  final controller = Get.put(StationController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Box
        Padding(
          padding: EdgeInsets.fromLTRB(12.w, 16.h, 12.w, 6.h),
          child: TextField(
            controller: controller.textController,
            onChanged: controller.updateSearch,
            onSubmitted: controller.updateSearch,
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
              prefixIcon: Icon(Icons.search, size: 22.sp),
              prefixIconColor: AppColors().app_primary,
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),

        // Suggestions and Result List
        Expanded(
          child: Obx(() {
            final results = controller.filteredStations;
            final suggestions = controller.suggestions;

            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              children: [
                if (controller.searchText.isNotEmpty && suggestions.isNotEmpty)
                  ...suggestions.map((s) => ListTile(
                    title: Text(
                      s,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'NotoSansBengali',
                      ),
                    ),
                    onTap: () => controller.updateSearch(s),
                  )),
                ...results.map((station) => StationCard(station: station)),
                if (controller.searchText.isNotEmpty && results.isEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Center(
                      child: Text(
                        'কোনো স্টেশন পাওয়া যায়নি',
                        style: TextStyle(
                          color: AppColors().app_primary,
                          fontSize: 16.sp,
                          fontFamily: 'NotoSansBengali',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          }),
        ),
      ],
    );
  }
}