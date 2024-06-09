// ignore_for_file: prefer_const_constructors, camel_case_types, constant_identifier_names

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphView extends StatelessWidget {
  const GraphView({
    super.key,
    required this.isShowingMainData,
  });

  final int isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      dataGet(),
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData dataGet() {
    switch (isShowingMainData) {
      case 1:
        return sampleData1;
      case 2:
        return sampleData2;
      case 3:
        return sampleData3;
      case 4:
        return sampleData4;
      case 5:
        return sampleData5;
      case 6:
        return sampleData6;
      default:
        return sampleData1;
    }
  }

  // DIFFERENTIAL
  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 6,
        maxY: 100,
        minY: 0,
      );

  // PHYSICS
  LineChartData get sampleData2 => LineChartData(
        lineTouchData: lineTouchData2,
        gridData: gridData,
        titlesData: titlesData2,
        borderData: borderData,
        lineBarsData: lineBarsData2,
        minX: 0,
        maxX: 6,
        maxY: 100,
        minY: 0,
      );

  // OOPS
  LineChartData get sampleData3 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData3,
        minX: 0,
        maxX: 6,
        maxY: 100,
        minY: 0,
      );
  // English
  LineChartData get sampleData4 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData4,
        minX: 0,
        maxX: 6,
        maxY: 100,
        minY: 0,
      );

  // Psychology
  LineChartData get sampleData5 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData5,
        minX: 0,
        maxX: 6,
        maxY: 100,
        minY: 0,
      );

  // Soft Skills
  LineChartData get sampleData6 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData6,
        minX: 0,
        maxX: 6,
        maxY: 100,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
      ];

  LineTouchData get lineTouchData2 => const LineTouchData(
        enabled: true,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData2 => [
        lineChartBarData2_1,
        lineChartBarData2_2,
      ];

  List<LineChartBarData> get lineBarsData3 => [
        lineChartBarData3_1,
        lineChartBarData3_2,
      ];

  List<LineChartBarData> get lineBarsData4 => [
        lineChartBarData4_1,
        lineChartBarData4_2,
      ];

  List<LineChartBarData> get lineBarsData5 => [
        lineChartBarData5_1,
        lineChartBarData5_2,
      ];

  List<LineChartBarData> get lineBarsData6 => [
        lineChartBarData6_1,
        lineChartBarData6_2,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: Colors.white,
    );
    String text;
    switch (value.toInt()) {
      case 25:
        text = '25';
        break;
      case 50:
        text = '50';
        break;
      case 75:
        text = '75';
        break;
      case 100:
        text = '100';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.white,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('CAT 1', style: style);
        break;
      case 3:
        text = const Text('CAT 2', style: style);
        break;
      case 5:
        text = const Text('FAT', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(
        show: true,
        drawVerticalLine: false
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.blue, width: 2),
          left: const BorderSide(color: Colors.blue, width: 2),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  // DIFFERENTIAL
  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Colors.blue,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 50),
          FlSpot(3, 30),
          FlSpot(5, 90),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: Colors.pink,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.blue,
        ),
        spots: const [
          FlSpot(1, 80),
          FlSpot(3, 50),
          FlSpot(5, 60),
        ],
      );

  // PHYSICS
  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
        isCurved: true,
        color: Colors.pink,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 40),
          FlSpot(3, 100),
          FlSpot(5, 80),
        ],
      );

  LineChartBarData get lineChartBarData2_2 => LineChartBarData(
        isCurved: true,
        color: Colors.blue,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.blue,
        ),
        spots: const [
          FlSpot(1, 30),
          FlSpot(3, 50),
          FlSpot(5, 90),
        ],
      );

  // OOPS
  LineChartBarData get lineChartBarData3_1 => LineChartBarData(
        isCurved: true,
        color: Colors.pink,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 60),
          FlSpot(3, 50),
          FlSpot(5, 60),
        ],
      );

  LineChartBarData get lineChartBarData3_2 => LineChartBarData(
        isCurved: true,
        color: Colors.blue,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.blue,
        ),
        spots: const [
          FlSpot(1, 70),
          FlSpot(3, 60),
          FlSpot(5, 50),
        ],
      );
  
  // English
  LineChartBarData get lineChartBarData4_1 => LineChartBarData(
        isCurved: true,
        color: Colors.pink,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 20),
          FlSpot(3, 60),
          FlSpot(5, 40),
        ],
      );

  LineChartBarData get lineChartBarData4_2 => LineChartBarData(
        isCurved: true,
        color: Colors.blue,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.blue,
        ),
        spots: const [
          FlSpot(1, 90),
          FlSpot(3, 50),
          FlSpot(5, 60),
        ],
      );

  // Psychology
  LineChartBarData get lineChartBarData5_1 => LineChartBarData(
        isCurved: true,
        color: Colors.pink,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 70),
          FlSpot(3, 87),
          FlSpot(5, 60),
        ],
      );

  LineChartBarData get lineChartBarData5_2 => LineChartBarData(
        isCurved: true,
        color: Colors.blue,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.blue,
        ),
        spots: const [
          FlSpot(1, 40),
          FlSpot(3, 34),
          FlSpot(5, 76),
        ],
      );

  // Soft Skills
  LineChartBarData get lineChartBarData6_1 => LineChartBarData(
        isCurved: true,
        color: Colors.pink,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 40),
          FlSpot(3, 86),
          FlSpot(5, 48),
        ],
      );

  LineChartBarData get lineChartBarData6_2 => LineChartBarData(
        isCurved: true,
        color: Colors.blue,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.blue,
        ),
        spots: const [
          FlSpot(1, 38),
          FlSpot(3, 58),
          FlSpot(5, 68),
        ],
      );
}
