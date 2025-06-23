import 'package:ffwc_app/models/other_features_item_model.dart';

import 'feature_item_model.dart';

class OtherFeatureModel {
  final String title;
  final List<OtherFeaturesItemModel> items;

  OtherFeatureModel({
    required this.title,
    required this.items,
  });

  factory OtherFeatureModel.fromJson(Map<String, dynamic> json) {
    var itemList = (json['items'] as List)
        .map((item) => OtherFeaturesItemModel.fromJson(item))
        .toList();

    return OtherFeatureModel(
      title: json['title'],
      items: itemList,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'items': items.map((e) => e.toJson()).toList(),
  };
}
