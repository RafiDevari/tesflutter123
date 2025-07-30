import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CertificateInfoCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const CertificateInfoCard({required this.item});

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
          Text(item['project_name'] ?? '-',
              style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text("Customer: ${item['customer_name'] ?? '-'}", style: TextStyle(color: Colors.black87)),
          Text("Company: ${item['company_name'] ?? '-'}", style: TextStyle(color: Colors.black87)),
          Text("Plantation: ${item['plantation_name'] ?? '-'}", style: TextStyle(color: Colors.black87)),
          Text("Date: ${item['date'] ?? '-'}", style: TextStyle(color: Colors.black87)),
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
}
