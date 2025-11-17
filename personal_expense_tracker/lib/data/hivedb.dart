import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_expense_tracker/models/expenses.dart';

class HiveDB {
  //ref
  final _myBox = Hive.box("database");

  //write
  void saveData(List<Expense> allExpense) {
    List<List<dynamic>> allExpenseFormated = [];

    for (var expense in allExpense) {
      //convert item into lsit of String or dateType
      List<dynamic> expenseFormated = [
        expense.name,
        expense.amount,
        expense.dateTime,
      ];
      allExpenseFormated.add(expenseFormated);
    }
    

    _myBox.put("ALL_EXPENSES", allExpenseFormated);
  }

  //read
  List<Expense> readData() {
    List savedExpenses = _myBox.get("ALL_EXPENSES") ?? [];
    List<Expense> allExpense = [];

    for (int i = 0; i < savedExpenses.length; i++) {
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][2];

      Expense expense = Expense(
        name: name, 
        amount: amount, 
        dateTime: dateTime,
      );

      //add expense to list
      allExpense.add(expense);
    }

    return allExpense;
  }
}