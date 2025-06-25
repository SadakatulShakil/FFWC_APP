import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StationInfoListView extends StatelessWidget {

  const StationInfoListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/logo.png', height: 96),
            SizedBox(height: 12),
            Text(
              "No Data Found yet",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}