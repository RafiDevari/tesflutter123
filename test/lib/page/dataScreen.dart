import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/component/sensorCard.dart';

import 'CertificateDetailScreen.dart';
import '../component/certificateInfoCard.dart';
import '../component/imageCard.dart';
import '../component/minMaxCard.dart';
import '../component/predictedCard.dart';

class DataScreen extends StatefulWidget {
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  List<dynamic> certificateData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('access_token') ?? '';
      final laravelSession = prefs.getString('laravel_session') ?? '';

      final response = await http.get(
        Uri.parse('https://ehara.iopri.co.id/api/mobile/analysis-data'),
        headers: {
          'Authorization': 'Bearer $token',
          'Cookie': 'laravel_session=$laravelSession',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        setState(() {
          certificateData = jsonResponse['data']['data']; // List of items
          isLoading = false;
        });
      } else {
        final jsonResponse = json.decode(response.body);
        debugPrint('Error: ${jsonResponse['meta']['message']}');
      }
    } catch (e) {
      setState(() => isLoading = false);
      print('Error fetching data: $e');
    }
  }


  Widget buildCertificateCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CertificateDetailScreen(item: item),
          ),
        );
      },
      child: CertificateInfoCard(item: item),
    );
  }


  @override
  Widget build(BuildContext context) {
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
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Data Certificate",
                      style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: isLoading
                        ? Center(child: CircularProgressIndicator(color: Colors.white))
                        : certificateData.isEmpty
                        ? Center(
                      child: Text(
                        "No certificate data found",
                        style: TextStyle(color: Colors.white70),
                      ),
                    )
                        : SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Column(
                          children: certificateData
                              .map<Widget>((item) => buildCertificateCard(item))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






