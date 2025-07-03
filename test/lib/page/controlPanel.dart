import 'package:flutter/material.dart';

import '../component/panelCard.dart';

class ControlPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF88C8C), Color(0xFF000000)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Date Selector ===
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFDA43C), Colors.white],
                        ),
                      ),
                      child: Row(
                        children: [
                          Text("21 Sept 2023", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                          Icon(Icons.arrow_drop_down,color: Colors.red),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/graph.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 10),

              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  children: [
                    PanelCard(
                      id: "321",
                      average: 54.3,
                      atas: 56,
                      tengah: 55,
                      bawah: 53,
                      timestamp: "2023-09-13 01:55:46",
                    ),
                    PanelCard(
                      id: "322",
                      average: 52.1,
                      atas: 54,
                      tengah: 50,
                      bawah: 52,
                      timestamp: "2023-09-13 02:00:00",
                    ),
                    PanelCard(
                      id: "323",
                      average: 58.9,
                      atas: 60,
                      tengah: 58,
                      bawah: 59,
                      timestamp: "2023-09-13 02:05:00",
                    ),
                    PanelCard(
                      id: "324",
                      average: 50.3,
                      atas: 51,
                      tengah: 49,
                      bawah: 51,
                      timestamp: "2023-09-13 02:10:00",
                    ),
                    PanelCard(
                      id: "325",
                      average: 55.0,
                      atas: 56,
                      tengah: 54,
                      bawah: 55,
                      timestamp: "2023-09-13 02:15:00",
                    ),
                    PanelCard(
                      id: "326",
                      average: 57.5,
                      atas: 59,
                      tengah: 56,
                      bawah: 57,
                      timestamp: "2023-09-13 02:20:00",
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

