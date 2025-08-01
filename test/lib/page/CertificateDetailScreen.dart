import 'package:flutter/material.dart';
import '../component/predictedCard.dart';
import '../component/minMaxCard.dart';
import '../component/imageCard.dart';
import '../component/sensorCard.dart';

class CertificateDetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const CertificateDetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    final dashboardData = item['dashboard_data'];

    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFCB9191), Color(0xFF000000)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Main content
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    "Certificate Details",
                    style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                PredictedCard(dashboardData: dashboardData),
                SizedBox(height: 16),
                MinMaxCard(dashboardData: dashboardData),
                SizedBox(height: 16),
                ImageCard(url: dashboardData['e_hara']['map_filename'] ?? ''),
                SizedBox(height: 16),
                SensorCard(
                  totalTrees: dashboardData["tot_rows"],
                  sensorName: dashboardData["sensor_type"],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
