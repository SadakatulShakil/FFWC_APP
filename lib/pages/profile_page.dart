import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Utills/AppColors.dart';
import '../controllers/profile/ProfileController.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Get.put(ProfileController());

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
                padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
                height: 200,
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
                top: 100,
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
                    child: Obx(
                          () => ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: [
                          SizedBox(height: 16),
                          // Profile Picture
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                maxRadius: 65,
                                backgroundColor: AppColors().app_primary,
                                child: CircleAvatar(
                                  radius: 63,
                                  backgroundImage: controller.selectedImagePath.value.isNotEmpty
                                      ? FileImage(File(controller.selectedImagePath.value))
                                      : AssetImage("assets/images/profile.png",) as ImageProvider,
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 0,
                                left: 100,
                                child: CircleAvatar(
                                  backgroundColor: Colors.blue.shade200,
                                  foregroundColor: AppColors().app_secondary,
                                  radius: 18,
                                  child: IconButton(
                                    onPressed: () {
                                      controller.pickImage();
                                    },
                                    icon: Icon(
                                      Icons.camera_alt_rounded,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // First Name
                                TextField(
                                  controller: controller.nameController,
                                  enabled: true,
                                  decoration: InputDecoration(
                                    label: Text(
                                      'First Name',
                                      style: TextStyle(
                                        color: AppColors().app_primary,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors().app_primary,
                                      ),
                                    ),
                                  ),
                                  cursorColor: AppColors().app_primary,
                                ),
                                SizedBox(height: 12),

                                // Last Name
                                TextField(
                                  controller: controller.nameController,
                                  enabled: true,
                                  decoration: InputDecoration(
                                    label: Text(
                                      'Last Name',
                                      style: TextStyle(
                                        color: AppColors().app_primary,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors().app_primary,
                                      ),
                                    ),
                                  ),
                                  cursorColor: AppColors().app_primary,
                                ),
                                SizedBox(height: 12),

                                // Mobile (disabled + verified)
                                Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    TextField(
                                      controller: controller.mobileController,
                                      readOnly: true,
                                      enabled: false,
                                      style: TextStyle(color: Colors.black87),
                                      decoration: InputDecoration(
                                        label: Text(
                                          'Mobile (view only)',
                                          style: TextStyle(
                                            color: AppColors().app_primary,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors().app_primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade100,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.verified,
                                              color: Colors.green,
                                              size: 16,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              "Verified",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),

                                // Address
                                TextField(
                                  controller: controller.addressController,
                                  enabled: true,
                                  decoration: InputDecoration(
                                    label: Text(
                                      "profile_info_address".tr,
                                      style: TextStyle(
                                        color: AppColors().app_primary,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors().app_primary,
                                      ),
                                    ),
                                  ),
                                  cursorColor: AppColors().app_primary,
                                ),
                                SizedBox(height: 24),

                                // Update Button
                                ElevatedButton(
                                  onPressed: controller.updateProfile,
                                  child: Text("profile_info_update_button".tr),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors().app_primary,
                                    foregroundColor: AppColors().app_secondary,
                                    textStyle: TextStyle(fontSize: 16),
                                    minimumSize: Size(100, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
}
