import 'dart:io';

import 'package:ffwc_app/controllers/navigation/navigation_controller.dart';
import 'package:ffwc_app/services/LocalizationString.dart';
import 'package:ffwc_app/services/firebase_service.dart';
import 'package:ffwc_app/services/location_service.dart';
import 'package:ffwc_app/services/user_pref_service.dart';
import 'package:ffwc_app/utills/firebase_option.dart';
import 'package:ffwc_app/utills/theme.dart';
import 'package:ffwc_app/utills/widgets/location_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controllers/mobile/MobileController.dart';
import 'controllers/navigation/navigation_binding.dart';
import 'controllers/settings/settings_controller.dart';
import 'controllers/theme/theme_controller.dart'; // Import your DBService

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize SharedPreferences
  final themeController = Get.put(ThemeController());
  await themeController.loadThemeFromPrefs();
  await UserPrefService().init();
  Get.put(SettingsController());
  final savedLang = UserPrefService().appLanguage;
  await LocationService().getLocation();

  try {
    if (kIsWeb || Platform.isAndroid || Platform.isIOS) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } on Exception catch (e, stack) {
    print('🔥 Location Initialization Error: $e');
    print(stack);
  }
  runApp(
    ScreenUtilInit(
      designSize: Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MyApp(savedLang),
    ),
  );
}

class MyApp extends StatelessWidget {
  final MobileController mobileController = Get.put(MobileController());
  final themeController = Get.find<ThemeController>();
  final FirebaseService _firebaseService = FirebaseService();
  final String savedLang;
  MyApp(this.savedLang);
  @override
  Widget build(BuildContext context) {
    _firebaseService.initNotifications();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // makes status bar transparent
      statusBarIconBrightness: Brightness.dark, // or Brightness.light depending on text color
    ));
    return Obx(()=>
        GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Inventory Report',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeController.themeMode.value,
          home: NotificationGatePage(),
          //getPages: AppPages.routes,
          initialBinding: NavigationBinding(),
          translations: LocalizationString(),
          locale: Locale(savedLang),
        ));
  }
}