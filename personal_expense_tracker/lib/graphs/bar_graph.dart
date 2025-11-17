import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:personal_expense_tracker/graphs/bar_data.dart';



class MyBarGraph extends StatelessWidget {
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;
  
  const MyBarGraph({
    super.key,
    required this.maxY,
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,  
    required this.friAmount,
    required this.satAmount,
    });

  @override
  Widget build(BuildContext context) {
    
    //init data
    BarData myBarData = BarData(
      sunAmount: sunAmount, 
      monAmount: monAmount, 
      tueAmount: tueAmount, 
      wedAmount: wedAmount, 
      thuAmount: thuAmount, 
      friAmount: friAmount, 
      satAmount: satAmount
    );

    myBarData.initBarData();



    return BarChart(
      BarChartData(
        maxY: maxY,
        minY: 0,
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
            )
          ),
        ),  
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: myBarData.barData
          .map((data) => BarChartGroupData(
            
            x: data.x,
            barRods: [
              BarChartRodData(
                toY: data.y,
                color: const Color.fromARGB(255, 255, 161, 38),
                width: 40,
                borderRadius: BorderRadius.circular(4),
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: maxY,
                  color: Colors.grey[850],
                )
              ),
            ],
          ),
        )
        .toList(),

      )
    );
  }
}


Widget getBottomTitles(double value, TitleMeta axisSide) {
  const style = TextStyle(
    color : Color.fromARGB(141, 255, 161, 38),
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('S', style: style);
      break;
    case 1:
      text = const Text('M', style: style);
      break;
    case 2:
      text = const Text('T', style: style);
      break;
    case 3:
      text = const Text('W', style: style);
      break;
    case 4:
      text = const Text('TH', style: style);
      break;
    case 5:
      text = const Text('F', style: style);
      break;
    case 6:
      text = const Text('S', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  
  return SideTitleWidget(
    meta: axisSide,
    child: text,
  );
}