import 'package:flutter/material.dart';

class DataInfoCard extends StatelessWidget {
  final Map<String, dynamic> eharaData;

  const DataInfoCard({required this.eharaData});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eharaData["location"] ?? '-',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 8),
          Text("Province: ${eharaData["location_province"] ?? '-'}", style: TextStyle(color: Colors.black87)),
          Text("City: ${eharaData["location_city"] ?? '-'}", style: TextStyle(color: Colors.black87)),
          Text("Subdistrict: ${eharaData["location_subdistrict"] ?? '-'}", style: TextStyle(color: Colors.black87)),
          if (eharaData["total_price"] != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Total Price: ${eharaData["total_price"]}",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
