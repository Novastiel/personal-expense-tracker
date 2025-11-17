import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/data/expense_data.dart';
import 'package:personal_expense_tracker/datetime/date_time.dart';
import 'package:personal_expense_tracker/graphs/bar_graph.dart';
import 'package:personal_expense_tracker/views/neubox.dart';
import 'package:provider/provider.dart';

class ExpenseSum extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpenseSum({
    super.key,
    required this.startOfWeek,
  });
  

  //calculate max
  double calculateMax(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
    ) {
      double? max = 100;
      
      List<double> values = [
        value.calculateDailyExpense()[sunday] ?? 0,
        value.calculateDailyExpense()[monday] ?? 0,
        value.calculateDailyExpense()[tuesday] ?? 0,
        value.calculateDailyExpense()[wednesday] ?? 0,
        value.calculateDailyExpense()[thursday] ?? 0,
        value.calculateDailyExpense()[friday] ?? 0,
        value.calculateDailyExpense()[saturday] ?? 0,
      ];

      //sort
      values.sort();
      max = values.last * 1.1;

      return max == 0 ? 100 : max;
  }

  //calculate week total
  String weekTotal(
      ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    List<double> values = [
      value.calculateDailyExpense()[sunday] ?? 0,
      value.calculateDailyExpense()[monday] ?? 0,
      value.calculateDailyExpense()[tuesday] ?? 0,
      value.calculateDailyExpense()[wednesday] ?? 0,
      value.calculateDailyExpense()[thursday] ?? 0,
      value.calculateDailyExpense()[friday] ?? 0,
      value.calculateDailyExpense()[saturday] ?? 0,
    ];

    double total = 0;
    for (int i=0; i < values.length; i++) {
      total += values[i];
    }

    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    //get yyyymmdd
    String sunday = convertDateTimeToString(startOfWeek.add(Duration(days: 0)));
    String monday = convertDateTimeToString(startOfWeek.add(Duration(days: 1)));
    String tuesday = convertDateTimeToString(startOfWeek.add(Duration(days: 2)));
    String wednesday = convertDateTimeToString(startOfWeek.add(Duration(days: 3)));
    String thursday = convertDateTimeToString(startOfWeek.add(Duration(days: 4)));
    String friday = convertDateTimeToString(startOfWeek.add(Duration(days: 5)));
    String saturday = convertDateTimeToString(startOfWeek.add(Duration(days: 6)));

  
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Column(
        children: [
          //total for week
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: NeuBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const Text('Week Total: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 136, 0)),
                    ),
                
                    Text(style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 255, 136, 0)), '\₱${weekTotal(value, sunday, monday, tuesday, 
                    wednesday, thursday, friday, saturday)}'), 
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: NeuBox(
              child: SizedBox(
                height: 200,
                child: MyBarGraph(
                  maxY: calculateMax(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday), 
                  sunAmount: value.calculateDailyExpense()[sunday] ?? 0, 
                  monAmount: value.calculateDailyExpense()[monday] ?? 0, 
                  tueAmount: value.calculateDailyExpense()[tuesday] ?? 0,
                  wedAmount: value.calculateDailyExpense()[wednesday] ?? 0,
                  thuAmount: value.calculateDailyExpense()[thursday] ?? 0,
                  friAmount: value.calculateDailyExpense()[friday] ?? 0,
                  satAmount: value.calculateDailyExpense()[saturday] ?? 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}