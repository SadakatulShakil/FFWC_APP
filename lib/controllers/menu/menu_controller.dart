import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../models/menu_model.dart';


class SubMenuController extends GetxController {
  final List<MenuItemModel> menuItems = [
    MenuItemModel(title: 'Menu 1', icon: Icons.map, type: 'map'),
    MenuItemModel(title: 'Menu 2', icon: Icons.picture_as_pdf, type: 'pdf'),
    MenuItemModel(title: 'Menu 3', icon: Icons.warning, type: 'alert'),
    MenuItemModel(title: 'Menu 4', icon: Icons.bar_chart, type: 'stats'),
    MenuItemModel(title: 'Menu 5', icon: Icons.settings, type: 'settings'),
    MenuItemModel(title: 'Menu 6', icon: Icons.info, type: 'info'),
  ];

  void handleMenuTap(String type) {
    switch (type) {
      case 'map':
        //Get.to(() => PageA());
        break;
      case 'pdf':
        //Get.to(() => PageB());
        break;
      case 'alert':
        //Get.to(() => PageC());
        break;
    // Add more cases
      default:
        Get.snackbar("Coming Soon", "This feature is under development");
    }
  }
}
