import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/station/water_level_controller.dart';
import 'district_details_information.dart';

class InfoGraphicalView extends StatelessWidget {
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
                padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
                height: 150,
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
                        padding: EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'স্টেশনের বর্তমান অবস্থা',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Water',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00E5CA),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 12.0,
                        right: 8.0,
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF00E5CA),
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),

              /// Top overlay panel with buttons + modal
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
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
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            'সর্বশেষ আপডেট: রবিবার ২৪ জুন, ২০২৫ রাত ৯.০০ টা',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                          ),),

                        ),
                        Obx(() => Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height -150,
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

              /// Floating modal overlay (appears on top of map)
              Positioned(
                top: 200,
                left: 5,
                right: 5,
                child: Obx(() => controller.showingDistricts.value
                    ? Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 6,
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
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            ),
                            backgroundColor: Colors.blue.shade50,
                          ),
                        ))
                            .toList(),
                      ),
                )
                    : const SizedBox.shrink()),
              ),

              /// Optional Logo or control elements
              Positioned(
                bottom: 20,
                left: 10,
                child: Row(
                  children: [
                    Image.asset('assets/images/logo.png', height: 65),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Flood Forecasting And Warning Center',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        Text('Bangladesh Water Development Board',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
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
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.only(
            topLeft: index == 0 ? Radius.circular(12) : Radius.zero,
            topRight: index == ctrl.stationCategories.length - 1 ? Radius.circular(12) : Radius.zero,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 4),
            Obx(() => Text(
              "(${ctrl.categoryCounts[title] ?? 0})",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            )),
          ],
        ),
      ),
    );
  }
}

