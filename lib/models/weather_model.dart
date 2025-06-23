class WeatherModel {
  final String temperature;
  final String icon;
  final String low;
  final String high;
  final String wind;

  WeatherModel({
    required this.temperature,
    required this.icon,
    required this.low,
    required this.high,
    required this.wind,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: json['temperature'],
      icon: json['icon'],
      low: json['low'],
      high: json['high'],
      wind: json['wind'],
    );
  }

  Map<String, dynamic> toJson() => {
    'temperature': temperature,
    'icon': icon,
    'low': low,
    'high': high,
    'wind': wind,
  };
}
