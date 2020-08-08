import 'package:bmicalculator/input_page.dart';
import 'package:bmicalculator/reuseable_cards.dart';
import 'package:flutter/material.dart';
import 'constants.dart';


class Result extends StatelessWidget {
  Result({@required this.interpretation, @required this.bmiResult, @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: TitleStyle,
              ),
            ),

          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: ActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF24D876),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiResult,
                    textAlign: TextAlign.center,
                    style: resultNum,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),

                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: "RE-CALCULATE",
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
