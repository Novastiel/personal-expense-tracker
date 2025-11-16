import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/pages/home_page.dart';
import 'package:personal_expense_tracker/themes/dark.dart';
import 'package:personal_expense_tracker/themes/light.dart';
import 'package:personal_expense_tracker/themes/theme_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    
    return MaterialApp(
      home: HomePage(),
      theme: lightMode,
    );
  }
}
