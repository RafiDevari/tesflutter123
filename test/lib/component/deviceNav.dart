import 'package:flutter/material.dart';

class DeviceNav extends StatelessWidget {
  const DeviceNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40, // adjust as needed
      left: 30,
      right: 30,
      child: Container(
        height: 70,
        padding: const EdgeInsets.only(left: 12, right: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xFFFDF7ED),
              Color(0xFFF5A623),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.air, color: Colors.black, size: 28),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.lightbulb, color: Colors.black, size: 28),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.ac_unit, color: Colors.black, size: 28),
            ),
          ],
        ),
      ),
    );
  }
}
