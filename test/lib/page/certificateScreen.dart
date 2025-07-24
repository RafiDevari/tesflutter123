import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CertificateScreen extends StatefulWidget {
  @override
  _CertificateScreenState createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  List<dynamic> certificateData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCertificateData();
  }

  Future<void> fetchCertificateData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://ehara.iopri.co.id/api/datatable?query_name=e_hara_certificate'));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        setState(() {
          certificateData = jsonResponse['data']['data'];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  Widget buildCertificateCard(Map<String, dynamic> item) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item['project_name'] ?? '-',
              style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text("Customer: ${item['customer_name'] ?? '-'}", style: TextStyle(color: Colors.black87)),
          Text("Company: ${item['company_name'] ?? '-'}", style: TextStyle(color: Colors.black87)),
          Text("Plantation: ${item['plantation_name'] ?? '-'}", style: TextStyle(color: Colors.black87)),
          Text("Date: ${item['date'] ?? '-'}", style: TextStyle(color: Colors.black87)),
          Text("Province: ${item['location_province'] ?? '-'}", style: TextStyle(color: Colors.black87)),
          Text("Sensor: ${item['sensor_type'] ?? '-'}", style: TextStyle(color: Colors.black87)),
          if (item['certificate_number'] != null && item['certificate_number'].isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("Certificate #: ${item['certificate_number']}",
                  style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w600)),
            ),
        ],
      ),
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
                      "e-Hara Certificate Data",
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
                        padding: const EdgeInsets.only(bottom: 20.0), // ✅ page bottom padding
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
