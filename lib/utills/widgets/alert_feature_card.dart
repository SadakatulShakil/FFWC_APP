import 'package:flutter/material.dart';

class AlertFeatureCard extends StatelessWidget {
  final String type;
  final String icon;
  final String label;

  const AlertFeatureCard({required this.type, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        /// navigate to a new page or show a dialog
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: type == 'danger'
                ? Colors.red.shade50
                : type == 'info'
                ? Colors.blue.shade50
                : type == 'medium'
                ? Colors.yellow.shade50
                : Colors.green.shade50,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  color: type == 'danger'
                      ? Colors.red.shade100
                      : type == 'info'
                      ? Colors.blue.shade100
                      : type == 'medium'
                      ? Colors.yellow.shade100
                      : Colors.green.shade100,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Image.asset(
                  icon,
                  width: 40,
                  height: 40,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(fontSize: 14, color: Colors.black), // Default style
                          children: [
                            const TextSpan(text: '(22 June 2025) The '),
                            TextSpan(
                              text: 'Sarigowain River',
                              style: TextStyle(
                                color: Colors.red[700], // River color
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const TextSpan(text: ' in Sylhet district, the '),
                            TextSpan(
                              text: 'Jadukata River',
                              style: TextStyle(
                                color: Colors.red[700], // River color
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const TextSpan(text: ' in Sunamganj district and the '),
                            TextSpan(
                              text: 'Someshwari River',
                              style: TextStyle(
                                color: Colors.red[700], // River color
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const TextSpan(text: ' in Netrakona '),
                            TextSpan(
                              text: 'View More...',
                              style: TextStyle(
                                color: Colors.blue, // "View More" color
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
