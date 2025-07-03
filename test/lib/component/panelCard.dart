import 'package:flutter/material.dart';

class PanelCard extends StatelessWidget {
  final String id;
  final double average;
  final int atas;
  final int tengah;
  final int bawah;
  final String timestamp;

  const PanelCard({
    Key? key,
    required this.id,
    required this.average,
    required this.atas,
    required this.tengah,
    required this.bawah,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0x00FDA43C),Color(0xFFFDA43C), ]),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Column 1: ID
            Text(id, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),

            SizedBox(width: 16),

            // Column 2: Main content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row 1: Avg and timestamp
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Avg $average", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("at $timestamp",
                          style: TextStyle(fontSize: 10, color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 4),

                  // Row 2: Sensor readings in a column
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("sensor atas : $atas", style: TextStyle(color: Color(0xFFFDA43C))),
                          Text("sensor tengah : $tengah", style: TextStyle(color: Color(0xFFFDA43C))),
                          Text("sensor bawah : $bawah", style: TextStyle(color: Color(0xFFFDA43C))),
                        ],
                      ),
                      Icon(Icons.favorite, color: Colors.tealAccent),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
