import 'dart:io';

import 'package:ffwc_app/controllers/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Utills/AppColors.dart';
import '../controllers/profile/ProfileController.dart';
import '../services/api_urls.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Get.put(ProfileController());
  final ThemeController theme_controller = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 50.h, 16.w, 16.h),
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1B8CBE), Color(0xFF09228F)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Obx(() => Row(
                      children: [
                        Expanded(
                          child: Text(
                            'প্রফাইল',
                            style: TextStyle(
                              fontFamily: 'NotoSansBengali',
                              letterSpacing: 0.3.sp,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        controller.isConfirmVisible.value
                            ? Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors().positive_bg.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: InkWell(
                              onTap: () => controller.uploadImage(),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    "Confirm",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                            : SizedBox.shrink(),
                      ],
                    )),
                  ),
                ),
              ),
              Positioned(
                top: 100.h,
                left: 0,
                right: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.r),
                    topLeft: Radius.circular(25.r),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.r),
                        topLeft: Radius.circular(25.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.r,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20.h),
                          Center(
                            child: Column(
                              children: [
                                Stack(children: [
                                  Obx(() {
                                    return CircleAvatar(
                                      maxRadius: 65.r,
                                      backgroundColor: AppColors().app_primary,
                                      child: CircleAvatar(
                                        radius: 63.r,
                                        backgroundImage:
                                        controller.selectedImagePath.value.isNotEmpty
                                            ? FileImage(File(
                                            controller.selectedImagePath.value))
                                            : AssetImage("assets/images/profile.png")
                                        as ImageProvider,
                                      ),
                                    );
                                  }),
                                  Positioned(
                                      child: CircleAvatar(
                                        backgroundColor: AppColors().app_primary_bg,
                                        foregroundColor: AppColors().app_secondary,
                                        radius: 18.r,
                                        child: IconButton(
                                            onPressed: () {
                                              controller.pickImage();
                                            },
                                            icon: Icon(
                                              Icons.camera_alt_rounded,
                                              size: 20.sp,
                                            )),
                                      ),
                                      bottom: 0,
                                      right: 0)
                                ]),
                                SizedBox(height: 16.h),
                                Obx(() => Text(controller.mobile.value)),
                                Obx(() => Text(controller.name.value,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700)))
                              ],
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: AppColors().app_primary,
                                      borderRadius: BorderRadius.circular(5.r)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                                    child: TabBar(
                                        dividerHeight: 0,
                                        labelColor: AppColors().app_primary,
                                        unselectedLabelColor:
                                        AppColors().card_background,
                                        indicatorWeight: 1,
                                        indicatorPadding: EdgeInsets.symmetric(
                                            vertical: 4.h),
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        indicatorColor:
                                        AppColors().card_background,
                                        indicator: BoxDecoration(
                                            color: AppColors().card_background,
                                            borderRadius:
                                            BorderRadius.circular(5.r)),
                                        controller: controller.tabController,
                                        tabs: [
                                          Tab(text: "profile_info".tr),
                                          Tab(text: "settings".tr),
                                          Tab(text: "profile_logout".tr),
                                        ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Container(
                              height: MediaQuery.of(context).size.longestSide,
                              child: TabBarView(
                                controller: controller.tabController,
                                children: [
                                  /// Profile Info Tab
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 16.h),
                                      _buildTextField(
                                          controller.nameController,
                                          "profile_info_name".tr),
                                      SizedBox(height: 16.h),
                                      _buildTextField(
                                          controller.emailController,
                                          "profile_info_email".tr),
                                      SizedBox(height: 16.h),
                                      _buildTextField(
                                          controller.addressController,
                                          "profile_info_address".tr),
                                      SizedBox(height: 16.h),
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width,
                                        child: ElevatedButton(
                                          onPressed: controller.updateProfile,
                                          child: Text(
                                              "profile_info_update_button".tr,
                                              style:
                                              TextStyle(fontSize: 16.sp)),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                              AppColors().app_primary,
                                              foregroundColor:
                                              AppColors().card_background,
                                              minimumSize: Size(100.w, 50.h),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      4.r))),
                                        ),
                                      )
                                    ],
                                  ),
                                  /// Settings Tab
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.w),
                                        child: Text("profile_language_select".tr,
                                            style: TextStyle(fontSize: 16.sp)),
                                      ),
                                      SizedBox(height: 10.h),
                                      _buildToggleLanguage(),
                                      SizedBox(height: 10.h),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.w),
                                        child: Text('Theme chnage',
                                            style: TextStyle(fontSize: 16.sp)),
                                      ),
                                      SizedBox(height: 10.h),
                                      _buildToggleTheme()
                                    ],
                                  ),
                                  /// Logout Tab
                                  Column(
                                    children: [
                                      SizedBox(height: 20.h),
                                      Center(
                                        child: CircleAvatar(
                                          backgroundColor:
                                          AppColors().app_alert_extreme,
                                          foregroundColor: Colors.white,
                                          radius: 30.r,
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.login_rounded,
                                                size: 30.sp),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text("profile_logout".tr,
                                          style: TextStyle(
                                              color: AppColors()
                                                  .app_alert_extreme,
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(height: 4.h),
                                      Text("profile_logout_text".tr,
                                          textAlign: TextAlign.center),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String labelText) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(labelText,
              style:
              TextStyle(color: AppColors().app_primary, fontSize: 14.sp)),
          enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors().app_primary)),
        ),
        cursorColor: AppColors().app_primary,
      ),
    );
  }

  Widget _buildToggleLanguage() {
    return Padding(
      padding: EdgeInsets.only(left: 3.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.r,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ToggleButtons(
          borderRadius: BorderRadius.circular(10.r),
          fillColor: AppColors().app_primary_bg,
          selectedColor: AppColors().app_primary,
          color: Colors.black54,
          textStyle: TextStyle(fontSize: 16.sp),
          isSelected: controller.selectedLanguage,
          onPressed: (int index) {
            controller.changeLanguage(index);
          },
          children: [
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              child: Text('English'),
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              child: Text('বাংলা'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleTheme() {
    return Padding(
      padding: EdgeInsets.only(left: 3.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.r,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Obx(() => ToggleButtons(
          borderRadius: BorderRadius.circular(10.r),
          fillColor: AppColors().app_primary_bg,
          selectedColor: AppColors().app_primary,
          color: Colors.black54,
          textStyle: TextStyle(fontSize: 16.sp),
          isSelected: [
            theme_controller.themeMode.value == ThemeMode.dark,
            theme_controller.themeMode.value == ThemeMode.light,
          ],
          onPressed: (int index) {
            if (index == 0 &&
                theme_controller.themeMode.value != ThemeMode.dark) {
              theme_controller.toggleTheme(false);
            } else if (index == 1 &&
                theme_controller.themeMode.value != ThemeMode.light) {
              theme_controller.toggleTheme(true);
            }
          },
          children: [
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              child: Text('🌙  Dark mode'),
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              child: Text('☀️  Light mode'),
            ),
          ],
        )),
      ),
    );
  }
}
