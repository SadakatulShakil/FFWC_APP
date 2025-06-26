
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/station_data_model.dart';

class StationCard extends StatelessWidget {
  final StationDataModel station;

  StationCard({required this.station});

  @override
  Widget build(BuildContext context) {
    final statusColor = station.status.contains('উত্তরণশীল')
        ? Colors.red
        : station.status.contains('নিম্নমুখী')
        ? Colors.green
        : Colors.black;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('স্টেশনের নাম: ${station.name}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Text.rich(
            TextSpan(
              style: TextStyle(fontSize: 14, color: Colors.black, height: 1.5),
              children: [
                TextSpan(text: 'নদীর নাম: '),
                TextSpan(
                  text: '${station.riverName}  ',
                  style: TextStyle(color: Colors.blue),
                ),
                TextSpan(text: 'উপজেলা: '),
                TextSpan(
                  text: '${station.upazila}  ',
                  style: TextStyle(color: Colors.blue),
                ),
                TextSpan(text: 'বিপদসীমার মাত্রা: '),
                TextSpan(
                  text: '${station.dangerLevel} ',
                  style: TextStyle(color: Colors.blue),
                ),
                TextSpan(text: 'গত 3 ঘন্টায়: '),
                TextSpan(
                  text: '${station.status} \n',
                  style: TextStyle(color: statusColor),
                ),
                TextSpan(text: 'পানির স্তর: ',),
                TextSpan(
                  text: '${station.currentLevel}',
                  style: TextStyle(color: Colors.blue),
                ),
                TextSpan(text: ' (${station.date})'),
                TextSpan(text: ' / পরিবর্তন: ',),
                TextSpan(
                    text: ' ${station.change}',
                  style: TextStyle(color: statusColor),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}