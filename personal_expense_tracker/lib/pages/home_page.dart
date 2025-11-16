import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/models/expenses.dart';
import 'package:personal_expense_tracker/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:personal_expense_tracker/data/expense_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //editing control
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();


  //add
  void addnewExpense() {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text('Add new expense'), 
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //name
            TextField(
              controller: newExpenseNameController,
            ),

            //amount
            TextField(
              controller: newExpenseAmountController,
            ),
          ],
        ),
        actions: [
          //save
          MaterialButton(
            onPressed: save,
            child: Text('Save'),
          ),

          //cancel
           MaterialButton(
            onPressed: cancel,
            child: Text('Cancel'),
          ),

        ],

      ),
    );
  }

  //save
  void save() {
    //create expense item
    Expense newExpense = Expense(
      name: newExpenseNameController.text,
      amount: newExpenseAmountController.text,
      dateTime: DateTime.now(),
    );

    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    Navigator.pop(context);
    clear();
  }

  //cancel
  void cancel() {
    Navigator.pop(context);
    clear();
  }

  //clear
  void clear() {
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: addnewExpense,
          child: Icon (Icons.add),
          ),

        body : ListView.builder(
          itemCount: value.getAllExpenseList().length,
          itemBuilder: (context, index) => ListTile(
            title: Text(value.getAllExpenseList()[index].name),
            subtitle: Text(value.getAllExpenseList()[index].dateTime.toString()),
            trailing: Text(
              style: TextStyle(
                fontSize: 15,
              ),
              '\$' + value.getAllExpenseList()[index].amount, 
            ),
          ),
        ),
      ),
    );
  }
}
