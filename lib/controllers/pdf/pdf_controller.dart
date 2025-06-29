import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

class PDFController extends GetxController {
  late PdfControllerPinch pdfController;
  var currentPage = 0.obs;
  var totalPages = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/pdf/report.pdf'),
      initialPage: 1,
    );

    pdfController.document.then((doc) {
      totalPages.value = doc.pagesCount;
    });
  }

  void onPageChanged(int page) {
    currentPage.value = page - 1;
  }

  void jumpToPage(int index) {
    pdfController.jumpToPage(index + 1);
    currentPage.value = index;
  }

  @override
  void onClose() {
    pdfController.dispose();
    super.onClose();
  }
}
