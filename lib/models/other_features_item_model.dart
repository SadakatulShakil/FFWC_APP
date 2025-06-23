class OtherFeaturesItemModel {
  final String icon;
  final String label;

  OtherFeaturesItemModel({
    required this.icon,
    required this.label,
  });

  factory OtherFeaturesItemModel.fromJson(Map<String, dynamic> json) {
    return OtherFeaturesItemModel(
      icon: json['icon'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() => {
    'icon': icon,
    'label': label,
  };
}
