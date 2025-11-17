import 'package:personal_expense_tracker/graphs/bar.dart';

class BarData {
  final double sunAmount; 
  final double monAmount; 
  final double tueAmount; 
  final double wedAmount; 
  final double thuAmount; 
  final double friAmount; 
  final double satAmount; 


  List<SingleBar> barData = [];

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
  });

  // init
  void initBarData() {
    barData = [
      // sun
      SingleBar(x: 0, y: sunAmount),

      // mon
      SingleBar(x: 1, y: monAmount),

      // tue
      SingleBar(x: 2, y: tueAmount),

      // wed
      SingleBar(x: 3, y: wedAmount),
      
      // thu
      SingleBar(x: 4, y: thuAmount),

      // fri
      SingleBar(x: 5, y: friAmount),

      // sat
      SingleBar(x: 6, y: satAmount),
    ];
  }
}