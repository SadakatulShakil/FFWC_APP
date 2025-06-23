import 'feature_item_model.dart';

class StationModel {
  final String title;
  final List<StationItemModel> items;

  StationModel({
    required this.title,
    required this.items,
  });

  factory StationModel.fromJson(Map<String, dynamic> json) {
    var itemList = (json['items'] as List)
        .map((item) => StationItemModel.fromJson(item))
        .toList();

    return StationModel(
      title: json['title'],
      items: itemList,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'items': items.map((e) => e.toJson()).toList(),
  };
}
