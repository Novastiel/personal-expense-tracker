import 'package:flutter/material.dart';


class NeuBox extends StatelessWidget {
  final Widget child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          // Subtle shadow
          BoxShadow(
            color: Colors.black,
            offset: const Offset(4, 4),
            blurRadius: 12
          ),

          BoxShadow(
            color:Colors.grey.shade900,
            offset: const Offset(-4, -4),
            blurRadius: 12,
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: child,
    );
  }
}