import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/data/expense_sum.dart';
import 'package:personal_expense_tracker/models/expenses.dart';
import 'package:personal_expense_tracker/views/expense_tile.dart';
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
  final newExpensePesosController = TextEditingController();
  final newExpenseCentavosController = TextEditingController();

  @override
  void initState() {
    super.initState();

    //prepare and display on startup
    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }


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
              decoration: const InputDecoration(
                hintText: "Expense Name",
                
              ),
            ),

            //amount
            Row(
              children: [
                //pesos
                Expanded(
                  child: TextField(
                    controller: newExpensePesosController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Pesos"
                    ),
                  ),
                ),

                //centavos
                Expanded(
                  child: TextField(
                    controller: newExpenseCentavosController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Centavos"
                    ),
                  ),
                ),
              ],
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
    //combine into a string
    String amount = '${newExpensePesosController.text}.${newExpenseCentavosController.text}';

    //create expense item
    Expense newExpense = Expense(
      name: newExpenseNameController.text,
      amount: amount,
      dateTime: DateTime.now(),
    );

    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    Navigator.pop(context);
    clear();
  }

  //delete
  void deleteExpense(Expense expense) {
    Provider.of<ExpenseData>(context, listen: false).deleteExpense(expense);
  }

  //cancel
  void cancel() {
    Navigator.pop(context);
    clear();
  }

  //clear
  void clear() {
    newExpenseNameController.clear();
    newExpensePesosController.clear();
    newExpenseCentavosController.clear();
  }
  

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 255, 161, 38),
          onPressed: addnewExpense,
          child: Icon (Icons.add),
        ),
        body : ListView(children: [
          
          const SizedBox(height: 35),
          
          //weekly sum
          ExpenseSum(startOfWeek: value.startOfWeekDate()),

          const SizedBox(height: 35),

          //expense list
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: value.getAllExpenseList().length,
            itemBuilder: (context, index) => ExpenseTile(
              name: value.getAllExpenseList()[index].name, 
              amount: value.getAllExpenseList()[index].amount, 
              dateTime: value.getAllExpenseList()[index].dateTime,
              deleteTapped: (p0) => 
                deleteExpense(value.getAllExpenseList()[index]),
            ),
          )
        ]),
      ),
    );
  }
}
