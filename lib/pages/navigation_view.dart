import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Utills/AppColors.dart';
import '../controllers/navigation/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildNavbarItem(Icons.home_filled, "Home", 0),
              buildNavbarItem(Icons.settings, "Settings", 1),
              buildNavbarItem(Icons.account_box, "Profile", 2),
              buildNavbarItem(Icons.dashboard_outlined, "Menu", 3),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.currentScreen),
    );
  }


  Widget buildNavbarItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => {controller.changePage(index)},
      splashFactory: NoSplash.splashFactory,
      child: Column(
        children: [
          Obx(()=> Icon( icon,
              color: controller.currentTab == index
                  ? AppColors().app_primary
                  : Colors.black54) ),
          Obx(()=> Text( label,
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
                fontSize: 16.sp,
                fontWeight: controller.currentTab == index
                ? FontWeight.w600
                : FontWeight.normal,
              color:  controller.currentTab == index
                  ? AppColors().app_primary
                  : Colors.black54 ),
          ))
        ],
      ),
    );
  }
}
