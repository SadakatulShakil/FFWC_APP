import 'package:flutter/material.dart';

class OtherFeatureCard extends StatelessWidget {
  final String icon;
  final String label;

  const OtherFeatureCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color:
            Colors.red.shade100,
                blurRadius: 4,
                offset: Offset(2, 2))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                width: 40,
                height: 40,
              ),
              SizedBox(height: 8),
              Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
