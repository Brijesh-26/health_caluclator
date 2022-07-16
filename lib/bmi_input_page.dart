import 'bmi_calculator_brain.dart';
import 'results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:health_caluclator/results.dart';

import 'bmi_calculator_brain.dart';
import 'icon_content.dart';
import 'myContainer.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

const Color inactiveColor = Color(0XFF424354);
const Color activeColor = Color(0XFF111328);

int height= 180;
int weight= 55;
int age= 20;

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveColor;
  Color femaleCardColor = inactiveColor;

  void updateColor(Gender gender) {
    //
    // gender== Gender.male ? (maleCardColor== inactiveColor ? maleCardColor= activeColor : maleCardColor= inactiveColor) :
    //                         (femaleCardColor== inactiveColor ? femaleCardColor= activeColor : femaleCardColor= inactiveColor);
    if (gender == Gender.male) {
      if (maleCardColor == inactiveColor) {
        maleCardColor = activeColor;
        femaleCardColor = inactiveColor;
      } else {
        maleCardColor = inactiveColor;
      }
    }
    if (gender == Gender.female) {
      if (femaleCardColor == inactiveColor) {
        femaleCardColor = activeColor;
        maleCardColor = inactiveColor;
      } else {
        femaleCardColor = inactiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Row(
                    children: [
                      myContainer(
                        colour: maleCardColor,
                        cardChild: myContainerChild(
                            icon: Icon(
                              Icons.male,
                              size: 80.0,
                            ),
                            name: 'male'),
                        onpress: () {
                          setState(() {
                            updateColor(Gender.male);
                          });
                        },
                      ),
                      myContainer(
                        colour: femaleCardColor,
                        cardChild: myContainerChild(
                            icon: Icon(
                              Icons.female,
                              size: 80.0,
                            ),
                            name: 'female'),
                        onpress: () {
                          setState(() {
                            updateColor(Gender.female);
                          });
                        },
                      ),
                    ],
                  )), // first part

              myContainer(
                onpress: (){
                  print('first part');
                },
                colour: Color(0XFF111328),
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('HEIGHT', textAlign: TextAlign.center,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900),textAlign: TextAlign.center,),

                        Text('cm',textAlign: TextAlign.justify,)
                      ],
                    ),
                    Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 250.0,
                        activeColor: Color(0XFFEB1555),
                        inactiveColor: Color(0XFFBDBE98),
                        onChanged: (double newvalue){
                          setState(() {
                            height= newvalue.round();
                          });

                        }

                    )
                  ],
                ),
              ), // middle part

              Expanded(
                  child: Row(
                    children: [
                      myContainer(

                        colour: Color(0XFF111328),
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT', textAlign: TextAlign.center,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(weight.toString(), style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900),textAlign: TextAlign.center,),

                                Text('kg',textAlign: TextAlign.justify,)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FloatingActionButton(
                                    backgroundColor: inactiveColor,
                                    elevation: 20.0,
                                    child: Icon(Icons.add, color: Colors.white,),
                                    onPressed: (){
                                      setState(() {
                                        weight= weight+1;
                                      });
                                    }

                                ),
                                FloatingActionButton(
                                    backgroundColor: inactiveColor,
                                    elevation: 20.0,
                                    child: Icon(Icons.remove, color: Colors.white,),
                                    onPressed: (){
                                      setState(() {
                                        weight= weight-1;
                                      });
                                    }

                                ),
                              ],
                            )
                          ],
                        ),

                        onpress: (){
                          print('last part');
                        },
                      ),
                      myContainer(
                        colour: Color(0XFF111328),
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE', textAlign: TextAlign.center,),
                            Text(age.toString(), style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900),textAlign: TextAlign.center,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FloatingActionButton(
                                    backgroundColor: inactiveColor,
                                    elevation: 2000.0,
                                    child: Icon(Icons.add, color: Colors.white,),
                                    onPressed: (){
                                      setState(() {
                                        age= age+1;
                                      });
                                    }

                                ),
                                FloatingActionButton(
                                    backgroundColor: inactiveColor,
                                    elevation: 20.0,
                                    child: Icon(Icons.remove, color: Colors.white,),
                                    onPressed: (){
                                      setState(() {
                                        age= age-1;
                                      });
                                    }

                                ),
                              ],
                            )
                          ],
                        ),
                        onpress: (){
                          print('last part');
                        },

                      ),
                    ],
                  )), // last part

              FlatButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Result()));

                  BMI_calculator_brain bmi_calc= BMI_calculator_brain(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        Result(
                          result_weight: bmi_calc.getResult(),
                          result_BMI: bmi_calc.calculateBMI(),
                          final_result: bmi_calc.getBMIVichar(),
                        )
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 5.0),
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'CALCULATE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

