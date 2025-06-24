import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StationFeatureCard extends StatelessWidget {
  final String title;
  final String value;
  final String label;

  const StationFeatureCard({
    required this.title,
    required this.value,
    required this.label,
  });

  String getBackgroundSvg() {
    if (title.contains("Severe")) return 'assets/svg/severe.svg';
    if (title.contains("Flood")) return 'assets/svg/flood.svg';
    if (title.contains("Warning")) return 'assets/svg/warning.svg';
    return 'assets/svg/normal.svg';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 150,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SvgPicture.asset(
              getBackgroundSvg(),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Spacer(),
                Text(value,
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: title.contains("Severe")
                            ? Colors.pinkAccent.shade400
                            : title.contains("Flood")
                            ? Colors.red.shade400
                            : title.contains("Warning")
                            ? Colors.orange.shade400
                            : Colors.green.shade400
                    )
                ),
                SizedBox(height: 4),
                Text(label,
                    style: TextStyle(fontSize: 12, color: Colors.black)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
