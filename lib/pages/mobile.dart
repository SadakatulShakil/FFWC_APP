import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/mobile/MobileController.dart';
import '../utills/AppColors.dart';

class Mobile extends StatefulWidget {
  const Mobile({super.key});

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  MobileController controller = Get.put(MobileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("welcome_message".tr,
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: 16.h),
              Image.asset('assets/icons/logo.png', height: 120.h),
              SizedBox(height: 10.h),
              Text("welcome_login".tr,
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(height: 10.h),
              Text("login_greetings".tr,
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: TextField(
                  controller: controller.mobile,
                  decoration: InputDecoration(
                    hintText: "01xxxxxxxxx",
                    label: Text(
                      "mobile_no_hint".tr,
                      style: TextStyle(
                        color: AppColors().app_primary,
                        fontFamily: 'NotoSansBengali',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.r),
                      borderSide: BorderSide(color: AppColors().app_primary),
                    ),
                  ),
                  cursorColor: AppColors().app_primary,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: ElevatedButton(
                    onPressed: controller.gotoOTP,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors().app_primary,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    child: Text("login_btn".tr,
                        style: TextStyle(
                          color: AppColors().white_font_color,
                          fontFamily: 'NotoSansBengali',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        )),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Text("Powered by RIMES", style: TextStyle(
                  fontFamily: 'NotoSansBengali',
                  fontSize: 14.sp)),
            ],
          ),
        ),
      ),
    );
  }
}
