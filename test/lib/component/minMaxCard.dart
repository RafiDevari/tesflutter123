import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MinMaxCard extends StatelessWidget {
  final Map<String, dynamic>? dashboardData;
  const MinMaxCard({required this.dashboardData});

  @override
  Widget build(BuildContext context) {
    if (dashboardData == null) return SizedBox();
    final min = dashboardData!['min_predicted'];
    final max = dashboardData!['max_predicted'];
    if (min == null || max == null || min.length < 4 || max.length < 4) return SizedBox();

    final labels = ['N', 'P', 'K', 'Mg'];

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
            "Min/Max Range",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 16),
          AspectRatio(
            aspectRatio: 1.2,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    BarChart(
                      BarChartData(
                        barGroups: List.generate(4, (i) {
                          final minVal = (min[i] as num).toDouble();
                          final maxVal = (max[i] as num).toDouble();
                          return BarChartGroupData(
                            x: i,
                            barRods: [
                              BarChartRodData(
                                toY: minVal,
                                width: 6,
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              BarChartRodData(
                                toY: maxVal,
                                width: 6,
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ],
                            barsSpace: 6,
                          );
                        }),
                        barTouchData: BarTouchData(enabled: false),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, _) {
                                int index = value.toInt();
                                if (index >= 0 && index < labels.length) {
                                  return Text(labels[index], style: TextStyle(color: Colors.black87));
                                }
                                return SizedBox();
                              },
                              reservedSize: 28,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, _) => Text(value.toStringAsFixed(2)),
                              reservedSize: 28,
                            ),
                          ),
                          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        ),
                        gridData: FlGridData(show: true),
                        borderData: FlBorderData(show: false),
                        alignment: BarChartAlignment.spaceBetween,
                        maxY: 4,
                      ),
                    ),

                    // Overlay value labels
                    ...List.generate(4, (i) {
                      final minVal = (min[i] as num).toDouble();
                      final maxVal = (max[i] as num).toDouble();

                      final chartHeight = constraints.maxHeight - 28; // Adjust for bottom padding
                      final groupWidth = constraints.maxWidth / 4;
                      final groupCenterX = (i + 0.5) * groupWidth;
                      final labelWidth = 40.0;

                      return Stack(
                        children: [
                          // Min value label
                          Positioned(
                            left: groupCenterX - labelWidth / 2,
                            bottom: 28 + (minVal / 4 * chartHeight) + 8,
                            child: Container(
                              width: labelWidth,
                              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.blueAccent, width: 1),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                minVal.toStringAsFixed(2),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ),
                          // Max value label
                          Positioned(
                            left: groupCenterX - labelWidth / 2,
                            bottom: 28 + (maxVal / 4 * chartHeight) + 8,
                            child: Container(
                              width: labelWidth,
                              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.green, width: 1),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                maxVal.toStringAsFixed(2),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legendBox(color: Colors.blueAccent, label: 'Min'),
              SizedBox(width: 12),
              _legendBox(color: Colors.green, label: 'Max'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _legendBox({required Color color, required String label}) {
    return Row(
      children: [
        Container(width: 14, height: 14, color: color),
        SizedBox(width: 6),
        Text(label, style: TextStyle(color: Colors.black)),
      ],
    );
  }
}
