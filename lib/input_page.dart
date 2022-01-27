import 'package:bmi_calculator/pink_button.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/child_content.dart';
import 'package:bmi_calculator/resusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'calculatorBrain.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  _InputPageState createState() => _InputPageState();
}

enum genderType { male, female }

class _InputPageState extends State<InputPage> {
  Color malecardColour = KinactiveCardColor;
  Color femalecardColour = KinactiveCardColor;
  // CalculatorBrain? calculator;

  genderType? selectGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectGender = genderType.male;
                      });
                    },
                    child: reusableCard(
                      colour: selectGender == genderType.male
                          ? KactiveCardcolor
                          : KinactiveCardColor,
                      cardchild: const childContent(
                          icon: FontAwesomeIcons.mars, label: 'Male'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectGender = genderType.female;
                      });
                    },
                    child: reusableCard(
                      colour: selectGender == genderType.female
                          ? KactiveCardcolor
                          : KinactiveCardColor,
                      cardchild: const childContent(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: reusableCard(
              colour: KactiveCardcolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: KlabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: KlabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 15, elevation: 20),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                      inactiveTrackColor: const Color(0XFF8D8E98),
                      activeTrackColor: Colors.white,
                      overlayColor: const Color(0X15EB15555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      max: KmaxsliderRange.toDouble(),
                      min: KminsliderRange.toDouble(),
                      thumbColor: Colors.pink,
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusableCard(
                    colour: KactiveCardcolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'WEIGHT ',
                          style: KlabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reusableCard(
                    colour: KactiveCardcolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'AGE',
                          style: KlabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          pink_button(
            onpress: () {
              CalculatorBrain calculator =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => resultPage(
                    bmiResult: calculator.calculateBmi(),
                    resultText: calculator.getResult(),
                    resultInfo: calculator.getInterpretation(),
                  ),
                ),
              );
            },
            ButtonName: 'CALCULATE BMI',
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.onpress});
  final IconData icon;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpress,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      disabledElevation: 6.0,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      elevation: 0.0,
    );
  }
}
