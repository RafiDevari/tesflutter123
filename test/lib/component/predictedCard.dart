import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PredictedCard extends StatefulWidget {
  final Map<String, dynamic>? dashboardData;

  const PredictedCard({required this.dashboardData});

  @override
  State<PredictedCard> createState() => _PredictedCardState();
}

class _PredictedCardState extends State<PredictedCard> {
  int currentIndex = 0;

  final nutrients = ['N', 'P', 'K', 'Mg'];

  double _getPercentage(String? value) {
    final parsed = double.tryParse(value ?? '');
    return ((parsed != null ? parsed / 100 : 0.0)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.dashboardData;
    if (data == null) return SizedBox();

    final values = {
      'N': data['predicted_n'],
      'P': data['predicted_p'],
      'K': data['predicted_k'],
      'Mg': data['predicted_mg'],
    };

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
        children: [
          SizedBox(height: 16),
          ExpandablePageView.builder(
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemCount: nutrients.length,
            itemBuilder: (context, i) {
              final nutrient = nutrients[i];
              final rawValue = values[nutrient];
              final percent = _getPercentage(rawValue);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Predicted $nutrient",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 12),
                  CircularPercentIndicator(
                    radius: 80,
                    lineWidth: 14,
                    percent: percent,
                    center: Text(
                      "${(percent * 100).toStringAsFixed(2)}%",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.grey[300]!,
                    progressColor: Colors.orange,
                    circularStrokeCap: CircularStrokeCap.round,
                    arcType: ArcType.HALF,
                    arcBackgroundColor: Colors.grey[200]!,
                  ),
                ],
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(nutrients.length, (index) {
              return Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == currentIndex ? Colors.orange : Colors.grey[400],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
