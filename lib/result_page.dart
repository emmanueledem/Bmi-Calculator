import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pink_button.dart';
import 'package:bmi_calculator/resusable_card.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

class resultPage extends StatelessWidget {
  const resultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.resultInfo});
  final bmiResult;
  final resultText;
  final resultInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: const Text(
                'Your result',
                textAlign: TextAlign.center,
                style: KTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: reusableCard(
                colour: KactiveCardcolor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bmiResult,
                      style: KResultTextStyle,
                    ),
                    Text(
                      resultText,
                      style: KBmiTextStyle,
                    ),
                    Text(
                      resultInfo,
                      style: KbodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
          ),
          pink_button(
            onpress: () => Navigator.pop(context),
            ButtonName: 'RE-CALCULATE ',
          ),
        ],
      ),
    );
  }
}
