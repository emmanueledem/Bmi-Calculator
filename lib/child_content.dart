import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
// ignore: camel_case_types
class childContent extends StatelessWidget {
 // ignore: use_key_in_widget_constructors
 const childContent({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(height: 15),
        Text(label, style: KlabelTextStyle)
      ],
    );
  }
}
