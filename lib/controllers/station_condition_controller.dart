import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../models/station_data_model.dart';

class StationController extends GetxController {
  final textController = TextEditingController();
  var stations = <StationDataModel>[
    StationDataModel(
      name: 'পাটেশ্বরী',
      riverName: 'সুন্দর',
      upazila: 'চিনামারি',
      dangerLevel: '১৯.৮৮ mMSL',
      currentLevel: '২০.০০ mMSL',
      date: '২৬-জুন-২০২৫',
      status: 'উত্তরণশীল',
      change: '+২.০ সেমি',
    ),
    StationDataModel(
      name: 'পাটেশ্বরী',
      riverName: 'সুন্দর',
      upazila: 'চিনামারি',
      dangerLevel: '১৯.৮৮ mMSL',
      currentLevel: '২০.০০ mMSL',
      date: '২৬-জুন-২০২৫',
      status: 'নিম্নমুখী',
      change: '-২.০ সেমি',
    ),
    StationDataModel(
      name: 'পটুয়াখালী',
      riverName: 'সুন্দর',
      upazila: 'চিনামারি',
      dangerLevel: '১৯.৮৮ mMSL',
      currentLevel: '২০.০০ mMSL',
      date: '২৬-জুন-২০২৫',
      status: 'নিম্নমুখী',
      change: '-২.০ সেমি',
    ),
    StationDataModel(
      name: 'রাউমারী',
      riverName: 'সুন্দর',
      upazila: 'চিনামারি',
      dangerLevel: '১৯.৮৮ mMSL',
      currentLevel: '২০.০০ mMSL',
      date: '২৬-জুন-২০২৫',
      status: 'উত্তরণশীল',
      change: '-২.০ সেমি',
    ),
    // Add more mock data as needed
  ].obs;

  var searchText = ''.obs;

  List<StationDataModel> get filteredStations {
    final query = searchText.value.toLowerCase();
    return stations.where((station) {
      return station.name.contains(query) ||
          station.status.contains(query);
    }).toList();
  }

  List<String> get suggestions {
    if (searchText.isEmpty) return [];
    return stations
        .map((s) => s.name)
        .where((name) => name.contains(searchText.value))
        .toSet()
        .toList();
  }

  void updateSearch(String text) {
    searchText.value = text;
  }
}