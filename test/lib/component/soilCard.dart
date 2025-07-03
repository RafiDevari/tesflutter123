import 'package:flutter/material.dart';

class SoilCard extends StatelessWidget {
  final String soilTemp;
  final String outsideTemp;
  final String humidity;
  final String devices;

  const SoilCard({
    Key? key,
    required this.soilTemp,
    required this.outsideTemp,
    required this.humidity,
    required this.devices,
  }) : super(key: key);

  Widget _buildTile(String value, String label) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFEB35B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: _buildTile(soilTemp, "Avg Soil Temp")),
                Container(width: 1, color: Color(0XFFEA9939)), // vertical divider
                Expanded(child: _buildTile(outsideTemp, "Outside Temp")),
              ],
            ),
          ),
          Container(height: 1, color: Color(0XFFEA9939)), // horizontal divider
          Expanded(
            child: Row(
              children: [
                Expanded(child: _buildTile(humidity, "Humidity")),
                Container(width: 1, color: Color(0XFFEA9939)),
                Expanded(child: _buildTile(devices, "Devices")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
