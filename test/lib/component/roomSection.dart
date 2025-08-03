import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test/page/certificateScreen.dart';
import 'package:test/page/controlPanel.dart';

import '../page/dataScreen.dart';

class RoomSection extends StatelessWidget {
  const RoomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 2.6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ControlPanel(),
              ),
            );
          },
          child: buildButton("Moisture Sensor"),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ControlPanel(),
              ),
            );
          },
          child: buildButton("NPK Sensor"),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ControlPanel(),
              ),
            );
          },
          child: buildButton("Temperature"),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ControlPanel(),
              ),
            );
          },
          child: buildButton("Drawing Room"),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CertificateScreen(),
              ),
            );
          },
          child: buildButton("Sertifikat"),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DataScreen(),
              ),
            );
          },
          child: buildButton("Analisis Data"),
        ),
      ],
    );
  }

  Widget buildButton(String label) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, Color(0xFFFDA43C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14, // slightly smaller for long labels
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
          maxLines: 2, // allow 2 lines
          overflow: TextOverflow.ellipsis, // show "..." if too long
          softWrap: true,
        ),
      ),
    );
  }
}
