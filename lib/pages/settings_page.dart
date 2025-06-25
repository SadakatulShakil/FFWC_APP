import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Utills/AppColors.dart';
import '../controllers/settings/settings_controller.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsController controller = Get.put(SettingsController());

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
              ///Background gradiant for appbar
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
                    child: Text(
                      'সেটিংস',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
                    child: ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.person_outline,
                            color: Colors.teal,
                          ),
                          title: Text(
                            'আমার প্রোফাইল',
                            style: TextStyle(fontSize: 16),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            // Navigate to profile page
                            //Get.to(() => ProfilePage());
                          },
                        ),
                        Divider(),

                        ListTile(
                          leading: Icon(Icons.language, color: Colors.teal),
                          title: Text(
                            'profile_language_select'.tr,
                            style: TextStyle(fontSize: 16),
                          ),
                          trailing: Container(
                            height: 30,
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
                              textStyle: TextStyle(fontSize: 12),
                              isSelected: controller.selectedLanguage,
                              onPressed: (int index) {
                                controller.changeLanguage(
                                  index,
                                ); // no need to call setState
                              },
                              children: [Text('EN'), Text('BN')],
                            ),
                          ),
                        ),
                        Divider(),

                        ListTile(
                          leading: Icon(Icons.logout, color: Colors.redAccent),
                          title: Text(
                            'লগআউট',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.redAccent,
                            ),
                          ),
                          onTap: () {
                            Get.defaultDialog(
                              title: 'নিশ্চিত?',
                              middleText: 'আপনি লগআউট করতে চান?',
                              textConfirm: 'হ্যাঁ',
                              textCancel: 'না',
                              onConfirm: () {
                                Get.back();
                                Get.offAllNamed('/login');
                              },
                              onCancel: () {},
                            );
                          },
                        ),
                      ],
                    ),
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
