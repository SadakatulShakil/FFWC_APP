import 'package:ffwc_app/models/feature_item_model.dart';
import 'package:ffwc_app/models/other_features_item_model.dart';
import 'package:ffwc_app/utills/widgets/other_feature_card.dart';
import 'package:flutter/material.dart';

import 'station_feature_card.dart';

class OtherFeatureSectionWidget extends StatelessWidget {
  final String title;
  final List<OtherFeaturesItemModel> items;

  const OtherFeatureSectionWidget({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black45)),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.cyan),
            ],
          ),
          SizedBox(height: 8,),
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 2),
              itemCount: items.length,
              separatorBuilder: (_, __) => SizedBox(width: 8),
              itemBuilder: (context, i) {
                return OtherFeatureCard(
                  icon: items[i].icon,
                  label: items[i].label,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}