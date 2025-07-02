import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Utills/AppColors.dart';
import '../controllers/otp/OtpController.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  OtpController controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("otp_title".tr),
        titleSpacing: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icons/logo.png', height: 120.h),
              SizedBox(height: 6.h),
              Text("otp_title".tr,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NotoSansBengali')),
              Text("otp_message".tr + '${controller.mobile}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'NotoSansBengali',
                  )),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOtpBox(controller.otp1),
                  _buildOtpBox(controller.otp2),
                  _buildOtpBox(controller.otp3),
                  _buildOtpBox(controller.otp4),
                ],
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.loginClick,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors().app_primary,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    child: Text("login_btn".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'NotoSansBengali',
                            fontSize: 16.sp)),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32.w),
                child: Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("wait".tr + "${controller.second.value}" + "after_wait".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'NotoSansBengali',
                            fontSize: 16.sp)),
                    controller.second.value == 0
                        ? InkWell(
                      onTap: () {
                        controller.resendOTP();
                      },
                      child: Text("resend_otp".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.blue,
                              fontFamily: 'NotoSansBengali',
                              fontSize: 16.sp)),
                    )
                        : Text("resend_otp".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                            fontFamily: 'NotoSansBengali',
                            fontSize: 16.sp)),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpBox(TextEditingController controller) {
    return SizedBox(
      height: 64.h,
      width: 64.w,
      child: TextField(
        controller: controller,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: Theme.of(context).textTheme.headlineSmall,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide(color: AppColors().app_primary),
          ),
        ),
        cursorColor: AppColors().app_primary,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
