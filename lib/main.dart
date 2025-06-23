import 'dart:io';

import 'package:ffwc_app/services/firebase_service.dart';
import 'package:ffwc_app/services/location_service.dart';
import 'package:ffwc_app/utills/firebase_option.dart';
import 'package:ffwc_app/utills/widgets/location_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart'; // Import your DBService

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize SharedPreferences
  //await UserPrefService().init();
  //Get.put(SettingsController());
  //final savedLang = UserPrefService().appLanguage;
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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();
  //final String savedLang;
  MyApp();
  @override
  Widget build(BuildContext context) {
    _firebaseService.initNotifications();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // makes status bar transparent
      statusBarIconBrightness: Brightness.dark, // or Brightness.light depending on text color
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory Report',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NotificationGatePage(),
      //getPages: AppPages.routes,
      //initialBinding: NavigationBinding(),
      //translations: LocalizationString(),
      //locale: Locale(savedLang),
    );
  }
}