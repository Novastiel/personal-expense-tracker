import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_expense_tracker/pages/home_page.dart';
import 'package:personal_expense_tracker/themes/dark.dart';
import 'package:provider/provider.dart';
import 'package:personal_expense_tracker/data/expense_data.dart';
import 'package:personal_expense_tracker/themes/theme_provider.dart';


void main() async {
  //init hive
  await Hive.initFlutter();

  //open hive
  await Hive.openBox("database");



  runApp(
    /* const MainApp() */
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MainApp(),
      )
    );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      builder: (context, child) => MaterialApp(
        home: HomePage(),
        theme: darkMode,
      ),
    );
  }
}
