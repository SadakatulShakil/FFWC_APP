import 'package:ffwc_app/controllers/station/water_level_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Utills/AppColors.dart';
import '../controllers/dashboard/dashboard_controller.dart';
import '../controllers/settings/settings_controller.dart';
import '../utills/widgets/alert_widget.dart';

class DistrictDetailsInformation extends StatefulWidget {
  final String districtName;
  final String categoryName;
  const DistrictDetailsInformation({super.key, required this.districtName, required this.categoryName});
  @override
  State<DistrictDetailsInformation> createState() => _DistrictDetailsInformationState();
}

class _DistrictDetailsInformationState extends State<DistrictDetailsInformation> {
  final WaterLevelController controller = Get.put(WaterLevelController());
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
              ///Background gradiant for appbar
              Container(
                padding: EdgeInsets.fromLTRB(10, 30, 16, 16),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1B8CBE), Color(0xFF09228F)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                    ],
                  )
                ),
              ),

              /// Curved section and List of content
              Positioned(
                top: 100,
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
                      color: Colors.grey.shade100,
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
                      padding: const EdgeInsets.all(8.0),
                      children: [
                        ListTile(
                          leading: Text(
                          '${widget.districtName.split(' (')[0]} স্টেশনের বিবরণ',
                            style: TextStyle(fontSize: 16),
                          ),
                          trailing: Container(
                            decoration: BoxDecoration(
                              color: widget.categoryName == 'সতর্কতা' ? Colors.orange.withOpacity(0.2) :
                              widget.categoryName == 'বন্যা' ? Colors.red.withOpacity(0.2) :
                              widget.categoryName == 'তীব্র বন্যা' ? Colors.pink.withOpacity(0.2) :
                              Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 2, bottom: 2),
                              child: Text(
                                widget.categoryName,
                                style: TextStyle(fontSize: 16,
                                    color: widget.categoryName == 'সতর্কতা'
                                        ? Colors.orange
                                        : widget.categoryName == 'বন্যা'
                                        ? Colors.red
                                        : widget.categoryName == 'তীব্র বন্যা'
                                        ? Colors.pink
                                        : Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height -150,
                              child: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(25.7519564000377, 89.2575465497694),
                                  zoom: 15,
                                ),
                                //markers: controller.markers.toSet(),
                                onMapCreated: controller.initializeMap,
                                mapType: MapType.normal,
                                myLocationEnabled: true,
                                compassEnabled: true,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('স্টেশনের নাম: পাটেশ্বরী', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                      Text.rich(
                                        TextSpan(
                                          style: TextStyle(fontSize: 14, color: Colors.black, height: 1.5),
                                          children: [
                                            TextSpan(text: 'নদীর নাম: '),
                                            TextSpan(
                                              text: 'সুরমা  ',
                                              style: TextStyle(color: Colors.blue),
                                            ),
                                            TextSpan(text: 'উপজেলা: '),
                                            TextSpan(
                                              text: 'চিলমানি  ',
                                              style: TextStyle(color: Colors.blue),
                                            ),
                                            TextSpan(text: 'বিপদের মাত্রা: '),
                                            TextSpan(
                                              text: '১৯.৮ mMSL ',
                                              style: TextStyle(color: Colors.blue),
                                            ),
                                            TextSpan(text: 'পানির স্তর: ',),
                                            TextSpan(
                                              text: '১০.৫৩ mMSL (০৩-জুন-২০২৫)\n',
                                              style: TextStyle(color: Colors.blue),
                                            ),
                                            TextSpan(text: 'গত 3 ঘন্টা: '),
                                            TextSpan(
                                              text: 'উদীয়মান ',
                                              style: TextStyle(color: Colors.red),
                                            ),
                                            TextSpan(text: ' গত ২৪ ঘন্টায়: '),
                                            TextSpan(text: ' উত্থান/পতন: ',),
                                            TextSpan(
                                              text: ' +২.০ সেমি}',
                                              style: TextStyle(color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('স্টেশনের নাম: পাটেশ্বরী', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                      Text.rich(
                                        TextSpan(
                                          style: TextStyle(fontSize: 14, color: Colors.black, height: 1.5),
                                          children: [
                                            TextSpan(text: 'নদীর নাম: '),
                                            TextSpan(
                                              text: 'সুরমা  ',
                                              style: TextStyle(color: Colors.blue),
                                            ),
                                            TextSpan(text: 'উপজেলা: '),
                                            TextSpan(
                                              text: 'চিলমানি  ',
                                              style: TextStyle(color: Colors.blue),
                                            ),
                                            TextSpan(text: 'বিপদের মাত্রা: '),
                                            TextSpan(
                                              text: '১৯.৮ mMSL ',
                                              style: TextStyle(color: Colors.blue),
                                            ),
                                            TextSpan(text: 'পানির স্তর: ',),
                                            TextSpan(
                                              text: '১০.৫৩ mMSL (০৩-জুন-২০২৫)\n',
                                              style: TextStyle(color: Colors.blue),
                                            ),
                                            TextSpan(text: 'গত 3 ঘন্টা: '),
                                            TextSpan(
                                              text: 'উদীয়মান ',
                                              style: TextStyle(color: Colors.red),
                                            ),
                                            TextSpan(text: ' গত ২৪ ঘন্টায়: '),
                                            TextSpan(text: ' উত্থান/পতন: ',),
                                            TextSpan(
                                              text: ' +২.০ সেমি}',
                                              style: TextStyle(color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.red.shade50,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 100,
                                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade100,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                        ),
                                      ),
                                      child: Image.asset(
                                        'assets/icons/danger_alert.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                style: const TextStyle(fontSize: 14, color: Colors.black), // Default style
                                                children: [
                                                  const TextSpan(text: '(22 June 2025) The '),
                                                  TextSpan(
                                                    text: 'Sarigowain River',
                                                    style: TextStyle(
                                                      color: Colors.red[700], // River color
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  const TextSpan(text: ' in Sylhet district, the '),
                                                  TextSpan(
                                                    text: 'Jadukata River',
                                                    style: TextStyle(
                                                      color: Colors.red[700], // River color
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  const TextSpan(text: ' in Sunamganj district and the '),
                                                  TextSpan(
                                                    text: 'Someshwari River',
                                                    style: TextStyle(
                                                      color: Colors.red[700], // River color
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  const TextSpan(text: ' in Netrakona '),
                                                  TextSpan(
                                                    text: 'View More...',
                                                    style: TextStyle(
                                                      color: Colors.blue, // "View More" color
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
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
