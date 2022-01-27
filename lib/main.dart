import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  BMICalculator({Key? key}) : super(key: key);
  dynamic mainColor = const Color(0xFF0A0E21);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const InputPage(),
      // routes: {
      //   '/Calculate': (context) => const resultPage(),
      // },
    );
  }
}
