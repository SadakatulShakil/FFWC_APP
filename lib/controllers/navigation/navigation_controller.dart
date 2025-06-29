import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/dashboard.dart';
import '../../pages/menu_page.dart';
import '../../pages/profile_page.dart';
import '../../pages/settings_page.dart';
import '../../services/user_pref_service.dart';
import '../dashboard/dashboard_controller.dart';
import '../menu/menu_controller.dart';
import '../profile/ProfileController.dart';
import '../settings/settings_controller.dart';

class NavigationController extends GetxController {
  //TODO: Implement HomeController
  static NavigationController get to => Get.find();

  final count = 0.obs;
  var currentTab = 0.obs;
  Widget get currentScreen {
    switch (currentTab.value) {
      case 0:
        return DashboardPage();
      case 1:
        return SettingsPage();
      case 2:
        return ProfilePage();
      case 3:
        return MenuPage();
      default:
        return DashboardPage();
    }
  }
  final userPrefService = UserPrefService();

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void onItemTapped(index) {
    currentTab.value = index;
  }

  void changePage(int index) {
    // Delete the controller if it exists, so it reinitializes next time
    if (index == 0 && Get.isRegistered<DashboardController>()) {
      Get.delete<DashboardController>(force: true);
    }
    if (index == 1 && Get.isRegistered<SettingsController>()) {
      Get.delete<SettingsController>(force: true);
    }
    if (index == 2 && Get.isRegistered<ProfileController>()) {
      Get.delete<ProfileController>(force: true);
    }
    if (index == 3 && Get.isRegistered<SubMenuController>()) {
      Get.delete<SubMenuController>(force: true);
    }

    currentTab.value = index;
  }
}
