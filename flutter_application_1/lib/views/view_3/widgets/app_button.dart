import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color backgroundcolor;
  final String label;
  final Color labelColor;
  final Color borderColor;

  const AppButton(
      {super.key,
      required this.backgroundcolor,
      required this.label,
      required this.labelColor,
      required this.borderColor});

  factory AppButton.red({required String label}) {
    return AppButton(
      borderColor: Colors.red,
      backgroundcolor: Colors.red,
      label: label,
      labelColor: Colors.white,
    );
  }
  factory AppButton.white({required String label}) {
    return AppButton(
      borderColor: const Color.fromARGB(255, 3, 59, 105),
      backgroundcolor: Colors.white,
      label: label,
      labelColor: const Color.fromARGB(255, 3, 59, 105),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(width: 2, color: borderColor),
        color: backgroundcolor,
      ),
      child: Text(
        label,
        style: TextStyle(color: labelColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
