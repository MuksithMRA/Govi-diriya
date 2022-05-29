import 'package:flutter/material.dart';
import 'package:govidiriya/constants/colors.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({
    Key? key,
    required this.farmersCount,
    required this.wholeSellerCount,
    required this.othersCount,
  }) : super(key: key);
  final double farmersCount;
  final double wholeSellerCount;
  final double othersCount;
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Farmers": farmersCount,
      "WholeSellers": wholeSellerCount,
      "Others": othersCount,
    };
    List<Color> colorList = [
      Colors.red,
      Colors.green,
      Colors.amber,
    ];
    return PieChart(
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 1200),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.disc,
      ringStrokeWidth: 32,
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: const ChartValuesOptions(
        chartValueStyle: TextStyle(
          color: kWhite,
        ),
        showChartValueBackground: false,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
    );
  }
}
