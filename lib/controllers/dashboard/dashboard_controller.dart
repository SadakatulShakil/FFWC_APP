import 'package:ffwc_app/models/alertFeatureModel.dart';
import 'package:ffwc_app/models/other_feature_model.dart';
import 'package:ffwc_app/models/weather_model.dart';
import 'package:get/get.dart';

import '../../models/feature_item_model.dart';
import '../../models/other_features_item_model.dart';
import '../../models/station_model.dart';
import '../../services/user_pref_service.dart';


class DashboardController extends GetxController {
  var selectedLocation = 'Current Location'.obs;
  var weatherData = <WeatherModel>[].obs;
  var station_features = <StationModel>[].obs;
  var other_features = <OtherFeatureModel>[].obs;
  var alert_features = <AlertFeatureModel>[].obs;
  final userService = UserPrefService();


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
        title: 'station_condition'.tr,
        items: [
          StationItemModel(title: 'severe_flood'.tr, value: '07'.tr, label: 'severe_mz'.tr),
          StationItemModel(title: 'flood'.tr, value: '06'.tr, label: 'flood_mz'.tr),
          StationItemModel(title: 'warning'.tr, value: '05'.tr, label: 'warning_mz'.tr),
          StationItemModel(title: 'normal'.tr, value: '04'.tr, label: 'normal_mz'.tr),
        ],
      ),
    ]);

    // Load initial Other features
    other_features.addAll([
      OtherFeatureModel(
        title: 'other_features'.tr,
        items: [
          OtherFeaturesItemModel(icon: 'assets/svg/rainfall.svg',  label: 'forecast_bulletin'.tr),
          OtherFeaturesItemModel(icon: 'assets/svg/bulletin.svg', label: 'rainfall_info'.tr),
          OtherFeaturesItemModel(icon: 'assets/svg/water_level.svg', label: 'water_level_forecast'.tr),
          OtherFeaturesItemModel(icon: 'assets/svg/bulletin.svg', label: 'inundation_map'.tr),
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
