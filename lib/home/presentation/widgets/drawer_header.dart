import 'package:flutter/material.dart';

import '../../../UIHelpers/images.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            child: Image.asset(
              Images.profile,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 4),
              Text(
                "Tony Roshdy",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
