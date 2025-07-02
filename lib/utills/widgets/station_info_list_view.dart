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
        TextField(
          controller: controller.textController,
          onChanged: controller.updateSearch,
          onSubmitted: controller.updateSearch,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'search_text'.tr,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.sp,
              fontFamily: 'NotoSansBengali',
              fontWeight: FontWeight.w400,
            ),
            label: Text('search_text'.tr),
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
        // Suggestions and Result List
        Expanded(
          child: Obx(() {
            final results = controller.filteredStations;
            final suggestions = controller.suggestions;

            return ListView(
              padding: EdgeInsets.symmetric(vertical: 4.h),
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
                        'no_results_found'.tr,
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