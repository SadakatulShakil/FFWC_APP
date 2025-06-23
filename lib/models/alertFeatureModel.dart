class AlertFeatureModel {
  final List<AlertItemModel> items;

  AlertFeatureModel({
    required this.items,
  });

  factory AlertFeatureModel.fromJson(Map<String, dynamic> json) {
    var itemList = (json['items'] as List)
        .map((item) => AlertItemModel.fromJson(item))
        .toList();

    return AlertFeatureModel(
      items: itemList,
    );
  }

  Map<String, dynamic> toJson() => {
    'items': items.map((e) => e.toJson()).toList(),
  };

}
class AlertItemModel {
  final String type;
  final String icon;
  final String label;

  AlertItemModel({
    required this.type,
    required this.icon,
    required this.label,
  });

  factory AlertItemModel.fromJson(Map<String, dynamic> json) {
    return AlertItemModel(
      type: json['type'],
      icon: json['icon'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'icon': icon,
    'label': label,
  };
}
