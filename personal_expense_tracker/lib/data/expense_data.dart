import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/data/hivedb.dart';
import 'package:personal_expense_tracker/models/expenses.dart';
import 'package:personal_expense_tracker/datetime/date_time.dart';

class ExpenseData extends ChangeNotifier{
  //expense list
  List<Expense> overallExpenseList = [];

  //get
  List<Expense> getAllExpenseList() {
    return overallExpenseList;
  }

  //display original data
  final db = HiveDB();
  void prepareData() {
    if (db.readData().isNotEmpty) {
      overallExpenseList = db.readData();
    }

  }

  //add
  void addNewExpense(Expense newExpense) {
    overallExpenseList.add(newExpense);

    notifyListeners();
    db.saveData(overallExpenseList);
  }

  //delete
  void deleteExpense(Expense expense) {
    overallExpenseList.remove(expense);

    notifyListeners();
  }

  //get weekday
  String getWeekday(DateTime dateTime) {
    switch(dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tues';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default: 
        return '';
    }
  }

  //get start of week date
  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

    //get today
    DateTime today = DateTime.now();

    //go iterate to find nearest sun
    for (int i=0; i < 7; i++) {
      if (getWeekday(today.subtract(Duration(days: i))) == 'Sun') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }

    return startOfWeek!;
  }


  Map<String, double> calculateDailyExpense() {
    Map<String, double> dailyExpenseSum = {
      //date (yyyymmdd)
    };

    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpenseSum.containsKey(date)) {
        double currentAmount = dailyExpenseSum[date]!;
        currentAmount += amount;
        dailyExpenseSum[date] = currentAmount;
      } else {
        dailyExpenseSum.addAll({date: amount});
      }
    }

    return dailyExpenseSum;
  }

}