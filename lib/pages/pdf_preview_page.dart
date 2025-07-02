import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

import '../../controllers/pdf/pdf_controller.dart';

class PDFPreviewPage extends StatelessWidget {
  final controller = Get.put(PDFController());

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Obx(
              () => Visibility(
            visible: controller.totalPages.value > 0,
            child: FloatingActionButton.extended(
              onPressed: () => _showPagePicker(context),
              label: Text(
                'go_to_page'.tr,
                style: TextStyle(fontSize: 14.sp),
              ),
              icon: Icon(Icons.input, size: 20.sp),
            ),
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              /// Top Bar
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 50.h, 16.w, 16.h),
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1B8CBE), Color(0xFF09228F)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'pdf_page'.tr,
                            style: TextStyle(
                              fontFamily: 'NotoSansBengali',
                              letterSpacing: 0.3.sp,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(() => Padding(
                      padding: EdgeInsets.all(12.r),
                      child: Text(
                        '${controller.currentPage.value + 1} / ${controller.totalPages.value}',
                        style: TextStyle(
                          fontFamily: 'NotoSansBengali',
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
                  ],
                ),
              ),

              /// PDF Viewer Area
              Positioned(
                top: 110.h,
                left: 0,
                right: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.r),
                    topLeft: Radius.circular(16.r),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.r,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Container(
                      color: Colors.white,
                      child: Obx(() {
                        return controller.totalPages.value == 0
                            ? Center(child: CircularProgressIndicator())
                            : PdfViewPinch(
                              controller: controller.pdfController,
                              scrollDirection: Axis.vertical,
                              onPageChanged: controller.onPageChanged,
                              backgroundDecoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                            );
                      }),
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

  void _showPagePicker(BuildContext context) {
    final TextEditingController inputController = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("page_no".tr, style: TextStyle(fontSize: 16.sp, fontFamily: 'NotoSansBengali', fontWeight: FontWeight.w600)),
        content: TextField(
          controller: inputController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: '1 - ${controller.totalPages.value}',
            hintStyle: TextStyle(fontSize: 14.sp, fontFamily: 'NotoSansBengali', fontWeight: FontWeight.w400),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("cancel".tr, style: TextStyle(fontSize: 14.sp, fontFamily: 'NotoSansBengali', fontWeight: FontWeight.w400)),
          ),
          TextButton(
            onPressed: () {
              int? page = int.tryParse(inputController.text);
              if (page != null &&
                  page > 0 &&
                  page <= controller.totalPages.value) {
                controller.jumpToPage(page - 1);
              }
              Navigator.of(context).pop();
            },
            child: Text("go".tr, style: TextStyle(fontSize: 14.sp, fontFamily: 'NotoSansBengali', fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}
