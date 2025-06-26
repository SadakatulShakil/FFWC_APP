import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/station/water_level_controller.dart';

class StationInfoGraphicalView extends StatelessWidget {
  const StationInfoGraphicalView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WaterLevelController controller = Get.put(WaterLevelController());
    double screenWidth = MediaQuery.of(context).size.width;
    controller.setZoomLevel(screenWidth);

    return Stack(
      children: [
        Obx(() => Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
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
        )),

        /// Legend at the top right corner
        // Positioned(
        //   right: 2,
        //   child: Card(
        //     elevation: 4,
        //     color: Colors.white,
        //     child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(left: 18.0),
        //             child: Text('Water Level Status Legend',
        //                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        //           ),
        //           _buildLegendItem("Normal - more than 50cm below danger level", Colors.green),
        //           _buildLegendItem("Warning - within 50cm below danger level", Colors.yellow),
        //           _buildLegendItem("Flood - above danger level", Colors.orange),
        //           _buildLegendItem("Severe Flood - more than 1m above danger level", Colors.red),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),

        /// Logo at the bottom right corner
        Positioned(
          bottom: 30,
          left: 10,
          child: Row(
            children: [
              Image.asset('assets/images/logo.png', height: 65),
              Column(
                children: [
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
    );
  }
  Widget _buildLegendItem(String text, Color color) {
    return Row(
      children: [
        Icon(Icons.location_on, color: color, size: 15),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}