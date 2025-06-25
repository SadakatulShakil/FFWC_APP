import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

import '../controllers/pdf/pdf_controller.dart';

class PDFViewerPage extends StatelessWidget {
  final controller = Get.put(PDFController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("PDF Viewer"),
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        children: [
          // Thumbnail navigation
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: FutureBuilder<PdfDocument>(
              future: controller.pdfController.document,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const LinearProgressIndicator();

                final doc = snapshot.data!;
                return SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: doc.pagesCount,
                    itemBuilder: (context, index) {
                      return FutureBuilder<PdfPageImage?>(
                        future: doc.getPage(index + 1).then((page) => page.render(
                          width: 100,
                          height: 100,
                          format: PdfPageImageFormat.png,
                        )),
                        builder: (context, snap) {
                          if (!snap.hasData) {
                            return Container(
                              width: 80,
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          }
                          return GestureDetector(
                            onTap: () => controller.jumpToPage(index),
                            child: Obx(() => AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              margin: const EdgeInsets.all(4),
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: controller.currentPage.value == index
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 2,
                                ),
                                boxShadow: [
                                  if (controller.currentPage.value == index)
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.2),
                                      blurRadius: 6,
                                      spreadRadius: 1,
                                    )
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.memory(
                                  snap.data!.bytes,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),

          // Main PDF Viewer
          Expanded(
            child: PdfViewPinch(
              controller: controller.pdfController,
              onPageChanged: (page) => controller.onPageChanged(page),
            ),
          ),
        ],
      ),
    );
  }
}
