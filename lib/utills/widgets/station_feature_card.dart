import 'package:flutter/material.dart';

class StationFeatureCard extends StatelessWidget {
  final String title;
  final String value;
  final String label;

  const StationFeatureCard({required this.title , required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      decoration: BoxDecoration(
        color: title.contains("Severe")
            ? Colors.pinkAccent.shade400
            : title.contains("Flood")
            ? Colors.red.shade400
            : title.contains("Warning")
            ? Colors.orange.shade300
            : Colors.green.shade300,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 4, offset: Offset(2, 2))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            Text(value,
                style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                )
            ),
            Text(label,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  )
            ),
          ],
        ),
      ),
    );
  }
}
