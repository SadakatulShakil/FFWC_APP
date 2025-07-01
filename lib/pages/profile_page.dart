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
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Obx(()=>Row(
                      children: [
                        Expanded(
                          child: Text(
                            "প্রফাইল",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        controller.isConfirmVisible.value
                            ? Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors().positive_bg
                                  .withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onTap: () => controller.uploadImage(),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
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
                    ),
                    ),
                  ),
                ),
              ),
              /// Curved section and List of content
              Positioned(
                top: 110.h,
                left: 0,
                right: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Center(
                            child: Column(
                              children: [
                                Stack(
                                    children: [
                                      Obx(() {
                                        return CircleAvatar(
                                          maxRadius: 65,
                                          backgroundColor: AppColors().app_primary,
                                          child: CircleAvatar(
                                            radius: 63,
                                            backgroundImage: controller.selectedImagePath.value.isNotEmpty
                                                ? FileImage(File(controller.selectedImagePath.value)) // Show preview
                                                : AssetImage("assets/images/profile.png" // Fallback image
                                            ) as ImageProvider, // Ensures correct type
                                          ),
                                        );
                                      }),
                                      Positioned(
                                          child: CircleAvatar(
                                            backgroundColor: AppColors().app_alert_severe,
                                            foregroundColor: AppColors().app_secondary,
                                            radius: 18,
                                            child: IconButton(onPressed: () {
                                              controller.pickImage();
                                            }, icon: Icon(Icons.camera_alt_rounded, size: 20,)),
                                          ),
                                          bottom: 0,
                                          right: 0
                                      )
                                    ]
                                ),
                                SizedBox(height: 16),
                                Obx(()=> Text(controller.mobile.value)),
                                Obx(()=> Text(controller.name.value, style: TextStyle( fontSize: 18, fontWeight: FontWeight.w700)),)
                              ],
                            ),
                          ),

                          SizedBox(height: 16),

                          /// TabBar
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                      color: AppColors().app_primary,
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 4),
                                        child: TabBar(
                                            dividerHeight: 0,
                                            labelColor: AppColors().app_primary,
                                            unselectedLabelColor: AppColors().app_secondary,
                                            indicatorWeight: 1,
                                            indicatorPadding: EdgeInsets.symmetric(vertical: 4),
                                            indicatorSize: TabBarIndicatorSize.tab,
                                            indicatorColor: AppColors().app_secondary,
                                            indicator: BoxDecoration(
                                                color: AppColors().app_secondary,
                                                borderRadius: BorderRadius.circular(5)
                                            ),
                                            controller: controller.tabController,
                                            tabs: [
                                              Tab(text: "profile_info".tr),
                                              Tab(text: "settings".tr),
                                              Tab(text: "profile_logout".tr),
                                            ]
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                                height: MediaQuery.of(context).size.longestSide,
                                child: TabBarView(
                                    controller: controller.tabController,
                                    children: [
                                      /// TabBar View 1
                                      // Profile View
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(top: 6),
                                            width: MediaQuery.of(context).size.width,
                                            child: TextField(
                                              controller: controller.nameController,
                                              enabled: true,
                                              decoration: InputDecoration(
                                                label: Text("profile_info_name".tr, style: TextStyle(color: AppColors().app_primary),),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey)),
                                                disabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey)),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: AppColors().app_primary)
                                                ),
                                              ),
                                              cursorColor: AppColors().app_primary,
                                            ),
                                          ),

                                          Container(
                                            padding: EdgeInsets.only(top: 16),
                                            width: MediaQuery.of(context).size.width,
                                            child: TextField(
                                              controller: controller.emailController,
                                              enabled: true,
                                              decoration: InputDecoration(
                                                label: Text("profile_info_email".tr, style: TextStyle(color: AppColors().app_primary),),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey)),
                                                disabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey)),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: AppColors().app_primary)
                                                ),
                                              ),
                                              cursorColor: AppColors().app_primary,
                                            ),
                                          ),

                                          SizedBox(height: 6),

                                          Container(
                                            padding: EdgeInsets.only(top: 12),
                                            width: MediaQuery.of(context).size.width,
                                            child: TextField(
                                              controller: controller.addressController,
                                              enabled: true,
                                              decoration: InputDecoration(
                                                label: Text("profile_info_address".tr, style: TextStyle(color: AppColors().app_primary),),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey)),
                                                disabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey)),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: AppColors().app_primary)
                                                ),
                                              ),
                                              cursorColor: AppColors().app_primary,
                                            ),
                                          ),

                                          SizedBox(height: 16),

                                          Container(
                                              width: MediaQuery.of(context).size.width,
                                              child: ElevatedButton(
                                                onPressed: controller.updateProfile,
                                                child: Text("profile_info_update_button".tr),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: AppColors().app_primary,
                                                    foregroundColor: AppColors().app_secondary,
                                                    textStyle: TextStyle(fontSize: 16),
                                                    minimumSize: Size(100, 50),
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                                                ),
                                              )
                                          ),

                                        ],
                                      ),
                                      /// TabBar View 2
                                      // Language
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5.0),
                                            child: Text("profile_language_select".tr, style: TextStyle(fontSize: 16),),
                                          ),
                                          SizedBox(height: 10),
                                          // Language Toggle Buttons
                                          Padding(
                                            padding: const EdgeInsets.only(left: 3.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5,
                                                    spreadRadius: 1,
                                                  ),
                                                ],
                                              ),
                                             child: ToggleButtons(
                                               borderRadius: BorderRadius.circular(10),
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
                                                   padding: const EdgeInsets.symmetric(
                                                       horizontal: 30, vertical: 10),
                                                   child: Text('English'),
                                                 ),
                                                 Padding(
                                                   padding: const EdgeInsets.symmetric(
                                                       horizontal: 30, vertical: 10),
                                                   child: Text('বাংলা'),
                                                 ),
                                               ],
                                             ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5.0),
                                            child: Text('Theme chnage', style: TextStyle(fontSize: 16),),
                                          ),
                                          SizedBox(height: 10),
                                          // Language Toggle Buttons
                                          Padding(
                                            padding: const EdgeInsets.only(left: 3.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5,
                                                    spreadRadius: 1,
                                                  ),
                                                ],
                                              ),
                                              child: Obx(() => ToggleButtons(
                                                borderRadius: BorderRadius.circular(10),
                                                fillColor: AppColors().app_primary_bg,
                                                selectedColor: AppColors().app_primary,
                                                color: Colors.black54,
                                                textStyle: TextStyle(fontSize: 16.sp),
                                                isSelected: [
                                                  theme_controller.themeMode.value == ThemeMode.dark,
                                                  theme_controller.themeMode.value == ThemeMode.light,
                                                ],
                                                onPressed: (int index) {
                                                  print("Selected index: $index");
                                                  if (index == 0 && theme_controller.themeMode.value != ThemeMode.dark) {
                                                    theme_controller.toggleTheme(false); // false = dark
                                                  } else if (index == 1 && theme_controller.themeMode.value != ThemeMode.light) {
                                                    theme_controller.toggleTheme(true); // true = light
                                                  }
                                                },

                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 30, vertical: 10),
                                                    child: Text('🌙  Dark mode'),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 30, vertical: 10),
                                                    child: Text('☀️  Light mode'),
                                                  ),
                                                ],
                                              )),
                                            ),
                                          ),
                                          // _buildOptionTile(Icons.lock, 'change_password'.tr, () {
                                          //   print('Password Change Clicked');
                                          // }),
                                          // _buildOptionTile(Icons.phone_android, 'help_center'.tr, () {
                                          //   var item = {
                                          //     "title": "help_center".tr,
                                          //     "url": ApiURL.sidebar_contact_us
                                          //   };
                                          //   //Get.to(()=> WebviewView(), binding: WebviewBinding(), arguments: item, transition: Transition.rightToLeft);
                                          // }),
                                          // _buildOptionTile(Icons.article, 'faq'.tr, () {
                                          //   var item = {
                                          //     "title": "faq".tr,
                                          //     "url": ApiURL.sidebar_faq
                                          //   };
                                          //   //Get.to(()=> WebviewView(), binding: WebviewBinding(), arguments: item, transition: Transition.rightToLeft);
                                          // }),
                                        ],
                                      ),
                                      /// TabBar View 3
                                      // Logout
                                      Column(
                                        children: [
                                          SizedBox(height: 20),
                                          Center(
                                            child: CircleAvatar(
                                              backgroundColor: AppColors().app_alert_extreme,
                                              foregroundColor: Colors.white,
                                              radius: 30,
                                              child: IconButton(onPressed: () {
                                                //controller.logout();
                                                }, icon: Icon(Icons.login_rounded, size: 30,)),
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text("profile_logout".tr, style: TextStyle(color: AppColors().app_alert_extreme, fontWeight: FontWeight.w500)),
                                          SizedBox(height: 4),
                                          Text("profile_logout_text".tr, textAlign: TextAlign.center,)
                                        ],
                                      )
                                    ]
                                )
                            ),
                          )

                        ],
                      ),
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile(IconData icon, String text, VoidCallback onTap) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, size: 30, color: AppColors().app_primary),
        title: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: AppColors().app_primary),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onTap: onTap,
      ),
    );
  }
}
