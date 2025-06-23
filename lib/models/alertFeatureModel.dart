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
  final String icon;
  final String label;

  AlertItemModel({
    required this.icon,
    required this.label,
  });

  factory AlertItemModel.fromJson(Map<String, dynamic> json) {
    return AlertItemModel(
      icon: json['icon'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() => {
    'icon': icon,
    'label': label,
  };
}
