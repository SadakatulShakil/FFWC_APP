// =================== controllers/dashboard_controller.dart ===================
import 'package:ffwc_app/models/alertFeatureModel.dart';
import 'package:ffwc_app/models/other_feature_model.dart';
import 'package:ffwc_app/models/weather_model.dart';
import 'package:get/get.dart';

import '../../models/feature_item_model.dart';
import '../../models/other_features_item_model.dart';
import '../../models/station_model.dart';


class DashboardController extends GetxController {
  var selectedLocation = 'Current Location'.obs;
  var weatherData = <WeatherModel>[].obs;
  var station_features = <StationModel>[].obs;
  var other_features = <OtherFeatureModel>[].obs;
  var alert_features = <AlertFeatureModel>[].obs;


  @override
  void onInit() {
    super.onInit();
    loadInitialData();
  }

  void loadInitialData() {
    // Load initial weather data
    weatherData.add(WeatherModel(
      temperature: '32',
      icon: '☀️',
      low: '28°C',
      high: '35°C',
      wind: '15%'
    ));

    // Load initial Station features
    station_features.addAll([
      StationModel(
        title: 'STATION CONDITIONS',
        items: [
          StationItemModel(title: 'Severe Flood', value: '07', label: 'More than 1 m above danger level'),
          StationItemModel(title: 'Flood', value: '06', label: 'Above danger level'),
          StationItemModel(title: 'Warning', value: '05', label: 'Within 50 cm below danger level'),
          StationItemModel(title: 'Normal', value: '04', label: 'More than 50 cm below danger level'),
        ],
      ),
    ]);

    // Load initial Other features
    other_features.addAll([
      OtherFeatureModel(
        title: 'OTHER FEATURES',
        items: [
          OtherFeaturesItemModel(icon: 'assets/icons/rainfall_icon.png',  label: 'Rainfall Map View'),
          OtherFeaturesItemModel(icon: 'assets/icons/water_level_icon.png', label: 'Current Water Level'),
          OtherFeaturesItemModel(icon: 'assets/icons/water_level_forecast_icon.png', label: 'Water Level Forecast'),
          OtherFeaturesItemModel(icon: 'assets/icons/inundation_icon.png', label: 'Inundation Map'),
        ],
      ),
    ]);

    // Load initial Alert features
    alert_features.addAll([
      AlertFeatureModel(
        items: [
          AlertItemModel(type: 'danger', icon: 'assets/icons/danger_alert.png', label: '(22 June 2025) The Sarigowain River in Sylhet district, the Jadukata River in Sunamganj district and the Someshwari River in Netrakona View More...'),
          AlertItemModel(type: 'info', icon: 'assets/icons/info_alert.png', label: '(22 June 2025) The Sarigowain River in Sylhet district, the Jadukata River in Sunamganj district and the Someshwari River in Netrakona View More...'),
          AlertItemModel(type: 'medium', icon: 'assets/icons/medium_alert.png', label: '(22 June 2025) The Sarigowain River in Sylhet district, the Jadukata River in Sunamganj district and the Someshwari River in Netrakona View More...'),
          AlertItemModel(type: 'danger', icon: 'assets/icons/danger_alert.png', label: '(22 June 2025) The Sarigowain River in Sylhet district, the Jadukata River in Sunamganj district and the Someshwari River in Netrakona View More...'),
        ],
      ),
    ]);
  }

}
