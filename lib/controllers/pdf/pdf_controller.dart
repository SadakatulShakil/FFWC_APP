import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

class PDFController extends GetxController {
  late PdfControllerPinch pdfController;
  final currentPage = 0.obs;
  final totalPages = 0.obs;

  @override
  void onInit() {
    pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/pdf/flood_pdf.pdf'),
    );
    super.onInit();
    // to ensure the PDF is loaded before initializing
    Future.delayed(Duration.zero, () => _initPdf());
  }

  Future<void> _initPdf() async {
    pdfController.document.then((doc) {
      totalPages.value = doc.pagesCount;
    });
  }

  void jumpToPage(int index) {
    print("Jumping to page: ${index + 1}");
    pdfController.jumpToPage(index + 1);
    currentPage.value = index;
  }

  void onPageChanged(int page) {
    print("Changed to page: $page");
    currentPage.value = page - 1;
  }


  @override
  void onClose() {
    pdfController.dispose();
    super.onClose();
  }
}
