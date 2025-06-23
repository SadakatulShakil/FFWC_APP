import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/dashboard/dashboard_controller.dart';
import '../utills/widgets/alert_widget.dart';
import '../utills/widgets/other_feature_section.dart';
import '../utills/widgets/station_feature_section.dart';

class WeatherDashboard extends StatelessWidget{
  final controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() => Container(
          height: double.infinity,
          child: Stack(
            children: [
              ///Background gif or image for animation
              Container(
                padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
                height: 240,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/gif/background.gif'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    /// Location Info
                    Row(
                      children: [
                        Text(
                          "Mirpur DOHS, Dhaka, Bangladesh",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.keyboard_arrow_down_sharp,
                            color: Colors.white, size: 20),
                      ],
                    ),
                    SizedBox(height: 5),
                    /// Temperature + Weather Info Row
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
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: '°C',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
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
                            Text(
                              'Partially Cloudy',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],

                        ),
                      ],
                    ),
                    /// bottom Small Details in weather data
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Feels like 36°C",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          height: 16,
                          width: 1,
                          color: Colors.cyan,
                        ),
                        SizedBox(width: 12),
                        Icon(Icons.arrow_drop_up_outlined, color: Colors.orange, size: 20),
                        SizedBox(width: 8),
                        Text(
                          "38°C",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.teal, size: 20),
                        SizedBox(width: 8),
                        Text(
                          "29%",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          height: 16,
                          width: 1,
                          color: Colors.cyan,
                        ),
                        SizedBox(width: 12),
                        Icon(Icons.water_outlined, color: Colors.blue, size: 20),
                        SizedBox(width: 8),
                        Text(
                          "29%",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    /// bottom Small Details in weather data
                  ],
                ),
              ),
              /// Curved section and List of content
              Positioned(
                top: 215,
                left: 0,
                right: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListView(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                      children: [
                        // First: Station features
                        ...controller.station_features.map((feature) => StationFeatureWidget(
                          title: feature.title,
                          items: feature.items,
                        )),

                        // Second: Other features
                        ...controller.other_features.map((feature) => OtherFeatureSectionWidget(
                          title: feature.title,
                          items: feature.items,
                        )),

                        SizedBox(height: 8),

                        ...controller.alert_features.map((feature) => AlertWidget(
                          items: feature.items,
                        )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ))
      ),
    );
  }
}