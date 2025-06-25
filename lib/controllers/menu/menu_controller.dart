import 'package:get/get.dart';

import '../../services/user_pref_service.dart';

class MenuController extends GetxController {
  final userPrefService = UserPrefService();

  @override
  void onInit() {
    super.onInit();
    // You can add any initialization logic here if needed
  }

  Future<void> logout() async {
    await userPrefService.clearUserData();
    Get.offAllNamed('/login'); // Redirect to login page after logout
  }
}