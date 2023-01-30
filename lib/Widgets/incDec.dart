import 'package:flutter/material.dart';

class incDec extends StatelessWidget {
  incDec({super.key, required this.wdt, required this.onPressed});
  Widget wdt;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        height: 30,
        width: 30,
        child: wdt,
        alignment: Alignment.center,
      ),
    );
  }
}
