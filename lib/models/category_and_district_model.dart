class DistrictInfo {
  final String id;
  final String name;
  final String count;

  DistrictInfo({required this.id, required this.name, required this.count});

  factory DistrictInfo.fromJson(Map<String, dynamic> json) {
    return DistrictInfo(
      id: json['Id'].toString(),
      name: json['Name'].toString(),
      count: json['Count'].toString(),
    );
  }
}

class StationCategory {
  final String categoryName;
  final List<DistrictInfo> districtInfo;

  StationCategory({required this.categoryName, required this.districtInfo});

  factory StationCategory.fromJson(Map<String, dynamic> json) {
    var list = json['District_info'] as List;
    return StationCategory(
      categoryName: json['Category_name'],
      districtInfo: list.map((e) => DistrictInfo.fromJson(e)).toList(),
    );
  }
}
