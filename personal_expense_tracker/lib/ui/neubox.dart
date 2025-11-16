import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class NeuBox extends StatelessWidget {
  final Widget child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {

    bool darkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          // Subtle shadow
          BoxShadow(
            color: darkMode ? Colors.black : Colors.grey.shade600,
            offset: const Offset(4, 4),
            blurRadius: 12,
          ),

          BoxShadow(
            color: darkMode ? Colors.grey.shade900 : Colors.white,
            offset: const Offset(-4, -4),
            blurRadius: 12,
          ),
        ],
      ),
      padding: const EdgeInsets.all(15),
      child: child,
    );
  }
}