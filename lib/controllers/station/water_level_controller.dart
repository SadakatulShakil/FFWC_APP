import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/category_and_district_model.dart';

class WaterLevelController extends GetxController {
  GoogleMapController? mapController;
  var markers = <Marker>{}.obs; // Observable Set of Markers
  var zoomLevel = 6.8.obs;
  var apiData = [].obs;

  final LatLng districtCenter = LatLng(25.7519564000377, 89.2575465497694);
  final LatLng bangladeshCenter = const LatLng(23.685, 90.3563);
  final LatLngBounds bangladeshBounds = LatLngBounds(
    southwest: LatLng(20.5, 88.0), // Bottom-left of BD
    northeast: LatLng(26.5, 92.5), // Top-right of BD
  );

  var stationCategories = <StationCategory>[].obs;
  var activeTab = 0.obs;
  var showingDistricts = false.obs;
  var visibleDistricts = <Map<String, String>>[].obs;

  void loadCategoryDistricts() {
    // Mock JSON response (replace with actual API response if needed)
    const jsonString = '''
    {
      "Station_detail_info": [
        {
          "Category_name": "সতর্কতা",
          "District_info": [
            {"Id": "1", "Name": "বরিশাল", "Count": "4"},
            {"Id": "2", "Name": "ফরিদপুর", "Count": "2"},
            {"Id": "3", "Name": "রংপুর", "Count": "1"}
          ]
        },
        {
          "Category_name": "বন্যা",
          "District_info": [
            {"Id": "1", "Name": "কক্সবাজার", "Count": "1"},
            {"Id": "2", "Name": "সিলেট", "Count": "2"},
            {"Id": "3", "Name": "বরিশাল", "Count": "3"}
          ]
        },
        {
          "Category_name": "তীব্র বন্যা",
          "District_info": [
            {"Id": "1", "Name": "ময়মনসিংহ", "Count": "4"},
            {"Id": "2", "Name": "রংপুর", "Count": "1"}
          ]
        }
      ]
    }
    ''';

    final data = jsonDecode(jsonString);
    var list = data['Station_detail_info'] as List;
    stationCategories.value = list.map((e) => StationCategory.fromJson(e)).toList();
  }

  void showCategoryDistricts(String categoryName) {
    final index = stationCategories.indexWhere((c) => c.categoryName == categoryName);
    if (index != -1) {
      activeTab.value = index;
      final category = stationCategories[index];
      visibleDistricts.value = category.districtInfo
          .map((d) => {
        'district': "${d.name} (${d.count})",
        'category': categoryName,
      })
          .toList();
      showingDistricts.value = true;
    }
  }


  Map<String, int> get categoryCounts => {
    for (var cat in stationCategories)
      cat.categoryName: cat.districtInfo.length
  };

  void hideDistricts() {
    showingDistricts.value = false;
  }


  @override
  void onInit() {
    super.onInit();
    _loadMarkers();
    loadCategoryDistricts();
  }

  void initializeMap(GoogleMapController controller) {
    mapController = controller;
    mapController!.moveCamera(CameraUpdate.newLatLngZoom(bangladeshCenter, zoomLevel.value));
  }

  void setZoomLevel(double screenWidth) {
    if (screenWidth < 360) {
      zoomLevel.value = 7.3;
    } else if (screenWidth < 480) {
      zoomLevel.value = 6.8;
    } else if (screenWidth < 600) {
      zoomLevel.value = 6.5;
    } else {
      zoomLevel.value = 6.2;
    }
  }

  void _loadMarkers() {
    apiData.value = [
      {
        "id": "1",
        "lat": 23.8103,
        "lng": 90.4125,
        "status": "Normal",
        "level": "More than 50 cm below danger level"
      },
      {
        "id": "2",
        "lat": 24.3636,
        "lng": 88.6241,
        "status": "Warning",
        "level": "Within 50 cm below danger level"
      },
      {
        "id": "3",
        "lat": 22.8456,
        "lng": 89.5403,
        "status": "Flood",
        "level": "Above danger level"
      },
      {
        "id": "4",
        "lat": 25.7439,
        "lng": 89.2752,
        "status": "Severe Flood",
        "level": "More than 1m above danger level"
      },
      {
        "id": "5",
        "lat": 23.0225,
        "lng": 91.3976,
        "status": "Normal",
        "level": "More than 50 cm below danger level"
      },
      {
        "id": "6",
        "lat": 23.5892,
        "lng": 89.0886,
        "status": "Warning",
        "level": "Within 50 cm below danger level"
      },
      {
        "id": "7",
        "lat": 23.5726,
        "lng": 90.3639,
        "status": "Flood",
        "level": "Above danger level"
      },
      {
        "id": "8",
        "lat": 25.1767,
        "lng": 88.4952,
        "status": "Severe Flood",
        "level": "More than 1m above danger level"
      },
      {
        "id": "9",
        "lat": 24.7743,
        "lng": 90.3890,
        "status": "Normal",
        "level": "More than 50 cm below danger level"
      },
      {
        "id": "10",
        "lat": 23.7956,
        "lng": 89.8288,
        "status": "Warning",
        "level": "Within 50 cm below danger level"
      },
      {
        "id": "11",
        "lat": 24.9218,
        "lng": 91.8339,
        "status": "Flood",
        "level": "Above danger level"
      },
      {
        "id": "12",
        "lat": 21.4272,
        "lng": 92.0058,
        "status": "Severe Flood",
        "level": "More than 1m above danger level"
      },
      {
        "id": "13",
        "lat": 23.6850,
        "lng": 89.3563,
        "status": "Normal",
        "level": "More than 50 cm below danger level"
      },
      {
        "id": "14",
        "lat": 24.8476,
        "lng": 89.3736,
        "status": "Warning",
        "level": "Within 50 cm below danger level"
      }
    ];

    Set<Marker> newMarkers = {};
    for (var data in apiData) {
      newMarkers.add(
        Marker(
          markerId: MarkerId(data['id']),
          position: LatLng(data['lat'], data['lng']),
          icon: _getMarkerIcon(data['status']),
          consumeTapEvents: true,
          onTap: () => showWaterLevelDialog(data),
        ),
      );
    }

    markers.value = newMarkers;
  }

  BitmapDescriptor _getMarkerIcon(String status) {
    switch (status) {
      case "Normal":
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
      case "Warning":
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
      case "Flood":
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
      case "Severe Flood":
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
      default:
        return BitmapDescriptor.defaultMarker;
    }
  }

  void showWaterLevelDialog(Map<String, dynamic> data) {
    Get.defaultDialog(
      title: "Water Level Status",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Location ID: ${data['id']}"),
          Text("Status: ${data['status']}", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Level: ${data['level']}"),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Get.snackbar("More Info", "Feature Coming Soon!"),
            child: const Text("Show More"),
          ),
        ],
      ),
    );
  }
}
