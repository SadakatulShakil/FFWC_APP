import 'package:ffwc_app/utills/widgets/other_feature_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/dashboard/dashboard_controller.dart';
import '../utills/widgets/station_feature_section.dart';

class DashboardPage2 extends StatelessWidget {
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() => Column(
          children: [
            // Weather Header
            Container(
              padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.lightBlue.shade100, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.all(4),
                        child: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 18),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Mirpur DOHS, Dhaka, Bangladesh",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Temperature + Weather Info Row
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
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                                color: Colors.cyan,
                              ),
                            ),
                            TextSpan(
                              text: '°C',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Colors.cyan,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // High/Low and Weather Icon Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset('assets/images/weather_icon.png', width: 70, height: 70),
                          SizedBox(height: 4),
                        ],

                      ),
                    ],
                  ),

                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.arrow_drop_up_outlined, color: Colors.orange, size: 20),
                              Text("${controller.weatherData[0].high}",
                                  style: TextStyle(color: Colors.orange, fontSize: 14)),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_drop_down, color: Colors.teal, size: 20),
                              Text("${controller.weatherData[0].low}",
                                  style: TextStyle(color: Colors.teal, fontSize: 14)),
                              SizedBox(width: 16),
                              Icon(Icons.air, color: Colors.redAccent, size: 20),
                              Text("${controller.weatherData[0].wind}",
                                  style: TextStyle(color: Colors.redAccent, fontSize: 14)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Partially Cloudy',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Features List
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                children: [
                  // First: Station features
                  ...controller.station_features.map((feature) => StationFeatureWidget(
                    title: feature.title,
                    items: feature.items,
                  )),

                  SizedBox(height: 16),

                  // Second: Other features
                  ...controller.other_features.map((feature) => OtherFeatureSectionWidget(
                    title: feature.title,
                    items: feature.items,
                  )),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}