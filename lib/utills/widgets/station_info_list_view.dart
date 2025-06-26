import 'package:ffwc_app/Utills/AppColors.dart';
import 'package:ffwc_app/utills/widgets/station_data_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/station_condition_controller.dart';
import '../../models/station_data_model.dart';

class StationInfoListView extends StatelessWidget {
  final controller = Get.put(StationController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Box
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 16, 12, 6),
          child: TextField(
            controller: controller.textController,
            onChanged: controller.updateSearch,
            onSubmitted: controller.updateSearch,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: 'স্টেশন অনুসারে অনুসন্ধান করুন',
              hintStyle: TextStyle(color: Colors.grey),
              labelStyle: TextStyle(color: AppColors().app_primary),
              label: Text('স্টেশন অনুসারে অনুসন্ধান করুন'),
              prefixIcon: Icon(Icons.search),
              prefixIconColor: AppColors().app_primary,
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
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
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              children: [
                if (controller.searchText.isNotEmpty && suggestions.isNotEmpty)
                  ...suggestions.map((s) => ListTile(
                    title: Text(s),
                    onTap: () => controller.updateSearch(s),
                  )),
                ...results.map((station) => StationCard(station: station)),
                if (controller.searchText.isNotEmpty && results.isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Center(
                      child: Text('কোনো স্টেশন পাওয়া যায়নি',
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
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