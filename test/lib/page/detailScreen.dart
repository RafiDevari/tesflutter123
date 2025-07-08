import 'package:flutter/material.dart';
import 'package:test/component/deviceNav.dart';

import '../component/SoilCard.dart';
import '../component/roomSection.dart';
import '../component/routineCard.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFCB9191),
                    Color(0xFF000000),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 100.0, left: 30.0, right: 30.0, bottom: 100.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'IOT',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              child: SoilCard(
                                soilTemp: "22°C",
                                outsideTemp: "60°F",
                                humidity: "60%",
                                devices: "3",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Room',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Center(child: RoomSection()),
                      SizedBox(height: 20),
                      Text(
                        'Routine',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          RoutineCard(
                            color: Color(0XFFFAA23B),
                            icon: Icons.sunny,
                            title: 'Morning',
                            iconColor: Colors.black,
                          ),
                          SizedBox(width: 20),
                          RoutineCard(
                            color: Color(0XFF3F3F3F),
                            icon: Icons.logout,
                            title: 'Afternoon',
                            iconColor: Color(0XFFFDA43C),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
          DeviceNav(),
        ],
      ),
    );
  }
}
