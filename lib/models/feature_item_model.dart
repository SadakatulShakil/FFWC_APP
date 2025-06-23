class StationItemModel {
  final String title;
  final String value;
  final String label;

  StationItemModel({
    required this.title,
    required this.value,
    required this.label,
  });

  factory StationItemModel.fromJson(Map<String, dynamic> json) {
    return StationItemModel(
      title: json['title'],
      value: json['value'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'value': value,
    'label': label,
  };
}
