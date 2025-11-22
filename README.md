# Intermediate Project - Personal Expense Tracker
A Intermediate Application for Personal Expense Tracker

## Key Features
- Add, Delete Expenses
- Hive Database
- Bar Graph
- Relative summary and calculations of most spent expenses in a day of week
- Weekly summary
- tiles to show expenses

## Widgets Used
**/data/expense_data.dart (1 Widget)**
- ChangeNotifier

**/graphs/bar_graph.dart (8 Widgets)**
- MyBarGraph, 
- StatelessWidget, 
- Widget, 
- BuildContext, 
- BarChart, 
- BarChartData, 
- Text, 
- TextStyle

**/pages/home_page.dart (20 Widgets)**
- HomePage, 
- StatefulWidget, 
- State, 
- Consumer, 
- Scaffold, 
- FloatingActionButton, 
- Icon, 
- ListView, 
- ListView.builder, 
- SizedBox, 
- ExpenseSum, 
- ExpenseTile, 
- AlertDialog, 
- Column, 
- TextField, 
- Row, 
- Expanded, 
- MaterialButton, 
- Text, 
- BuildContext

**/themes/dark.dart	(1 Widget)**
- ThemeData

**/themes/light.dart (1 Widget)**	
- ThemeData

**/themes/theme_provider.dart (1 Widget)**
- ChangeNotifier

**/views/expense_tile.dart (9 Widgets)**
- ExpenseTile, 
- StatelessWidget, 
- Padding, 
- Slidable, 
- ActionPane, 
- SlidableAction, 
- NeuBox, 
- ListTile, 
- Text, 
- BuildContext

**/views/neubox.dart	(3 Widgets)**
- NeuBox, 
- StatelessWidget, 
- Container, 
- BuildContext


## Steps to run
- Step 1: open the project through VSC
- Step 2: launch your prefered emulator
- Step 3: Run and Debug main.dart
- Step 4(in case of any problems): Save each file in the /lib folder

## Reflection
- This project was very difficult one. After the music player, dealing with a project with a database was even more challenging. My biggest problem was having the expenses being able to save and show on the bar graphs. the used of indexs was extremely complicated and i had to result to looking at other projects made for reference and help.

