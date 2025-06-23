import 'package:flutter/material.dart';

import '../AppColors.dart';

class AlertFeatureCard extends StatelessWidget {
  final String icon;
  final String label;

  const AlertFeatureCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        /// navigate to a new page or show a dialog
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 85,
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.red.shade200,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue.shade100,
                  child: Image.asset(
                    icon,
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '(22 June 2025) The Sarigowain River in Sylhet district, the Jadukata River in Sunamganj district and the Someshwari River in Netrakona View More...',
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16,),
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
