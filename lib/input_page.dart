import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseable_cards.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'result.dart';
import 'calculate.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(    //the first two boxes
            children: <Widget>[
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                colour: selectedGender == Gender.male ? ActiveCardColor : InActiveCardColor,
                cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',
                ),
              ),
              ),
              Expanded(
                child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender=Gender.female;
                  });
                },
                  colour: selectedGender == Gender.female ? ActiveCardColor : InActiveCardColor,
                  cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
              ),
              ),
            ],
          ),
          ),
          Expanded(
            child: ReusableCard(
                colour: ActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("HEIGHT", style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                    Text(
                      height.toString(),
                      style: numStyle,
                    ),
                    Text(
                      'cm',
                      style: labelTextStyle,
                    ),
                  ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFeb1555),
                      overlayColor: Color(0x29eb1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0) ,
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),   //middle one
          Expanded(child: Row(    //the first two boxes
            children: <Widget>[
              Expanded(child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT', style: labelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: numStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        RoundIconButton(
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                          icon: FontAwesomeIcons.minus,
                        ),
                        SizedBox(width: 10.0,
                        ),
                        RoundIconButton(
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                          icon: FontAwesomeIcons.plus,
                        ),
                      ],
                    ),
                  ],
                ),
                  colour: ActiveCardColor
              ),
              ),
              Expanded(child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE', style: labelTextStyle,
                    ),
                    Text(
                      age.toString(), style: numStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                          icon: FontAwesomeIcons.minus,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                          icon: FontAwesomeIcons.plus,
                        ),
                      ],
                    ),
                  ],
                ),
                  colour: ActiveCardColor
              ),
              ),
            ],
          ),
          ),   //last two boxes
          BottomButton(
            buttonTitle: "CALCULATE",
            onTap: (){
              CalculatorBrain calc =  CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Result(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ),
              ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),),
        ),
        color: BottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 15.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}

//MAKING OUR CUSTOM FLUTTER WIDGETS !!
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 2.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
    );
  }
}

