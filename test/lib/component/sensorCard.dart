import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SensorCard extends StatelessWidget {
  final int totalTrees;
  final String sensorName;

  const SensorCard({
    required this.totalTrees,
    required this.sensorName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, Color(0xFFFDA43C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _infoTile(
            icon: Icons.nature,
            label: 'Total Pohon',
            value: totalTrees.toString(),
            color: Colors.green[700]!,
          ),
          _infoTile(
            icon: Icons.camera,
            label: 'Sensor Digunakan',
            value: sensorName,
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }

  Widget _infoTile({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: 36),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.black87)),
        SizedBox(height: 4),
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
      ],
    );
  }
}
