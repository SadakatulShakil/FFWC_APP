import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

import '../../controllers/pdf/pdf_controller.dart';

class PDFPreviewPage extends StatelessWidget {
  final controller = Get.put(PDFController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
        centerTitle: true,
        actions: [
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Text(
                  '${controller.currentPage.value + 1} / ${controller.totalPages.value}',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        return controller.totalPages.value == 0
            ? Center(child: CircularProgressIndicator())
            : PdfViewPinch(
              controller: controller.pdfController,
              scrollDirection: Axis.vertical,
              onPageChanged: controller.onPageChanged,
              backgroundDecoration: BoxDecoration(color: Colors.white),
            );
      }),
      floatingActionButton: Obx(
        () => Visibility(
          visible: controller.totalPages.value > 0,
          child: FloatingActionButton.extended(
            onPressed: () => _showPagePicker(context),
            label: Text('Go to page'),
            icon: Icon(Icons.input),
          ),
        ),
      ),
    );
  }

  void _showPagePicker(BuildContext context) {
    final TextEditingController inputController = TextEditingController();
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Enter Page Number"),
            content: TextField(
              controller: inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '1 - ${controller.totalPages.value}',
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel")),
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
                child: Text("Go"),
              ),
            ],
          ),
    );
  }
}
