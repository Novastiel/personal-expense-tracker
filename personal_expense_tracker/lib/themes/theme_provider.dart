import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/themes/dark.dart';
/* import 'package:personal_expense_tracker/themes/light.dart'; */


class ThemeProvider extends ChangeNotifier {
  // Start darkmode
  ThemeData _themeData = darkMode;
  
  // get theme
  ThemeData get themeData =>  _themeData;

  // isdarkmode
  bool get isDarkMode => _themeData == darkMode;

  //set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;

    //Update UI
    notifyListeners();
  }

  //toggle
/*   void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  } */
}