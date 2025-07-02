import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/station/water_level_controller.dart';

class StationInfoGraphicalView extends StatelessWidget {
  const StationInfoGraphicalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WaterLevelController controller = Get.put(WaterLevelController());

    // Set zoom level responsively
    double screenWidth = MediaQuery.of(context).size.width;
    controller.setZoomLevel(screenWidth);

    return Stack(
      children: [
        Obx(() => GoogleMap(
          initialCameraPosition: CameraPosition(
            target: controller.bangladeshCenter,
            zoom: controller.zoomLevel.value,
          ),
          markers: controller.markers.toSet(),
          onMapCreated: controller.initializeMap,
          mapType: MapType.normal,
          myLocationEnabled: true,
          compassEnabled: true,
        )),

        /// Bottom logo section
        Positioned(
          bottom: 30.h,
          left: 10.w,
          child: Row(
            children: [
              Image.asset('assets/images/logo.png', height: 55.h),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flood Forecasting And Warning Center',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Bangladesh Water Development Board',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLegendItem(String text, Color color) {
    return Row(
      children: [
        Icon(Icons.location_on, color: color, size: 15.sp),
        SizedBox(width: 6.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 10.sp),
          ),
        ),
      ],
    );
  }
}
