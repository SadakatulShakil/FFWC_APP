import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/dashboard.dart';
import '../../services/notification_service.dart';

class NotificationGatePage extends StatefulWidget {
  @override
  State<NotificationGatePage> createState() => _NotificationGatePageState();
}

class _NotificationGatePageState extends State<NotificationGatePage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    iniNotification();
  }

  Future<void> iniNotification() async {
    try {
      //Ask for notification permission first
      await NotificationService().init();


      //Proceed to main page if all ok
      Get.offAll(() => DashboardPage(), transition: Transition.downToUp);

    } catch (e) {
      print('Permission error: $e');
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/weather_icon.png', height: 96),
            SizedBox(height: 12),
            Text("Powered by RIMES"),
          ],
        )
            : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Location required to proceed."),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                iniNotification(); // Try again
              },
              child: Text("Try Again"),
            )
          ],
        ),
      ),
    );
  }
}
