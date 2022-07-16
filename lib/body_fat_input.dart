import 'package:flutter/material.dart';
import 'package:health_caluclator/fat_calculator_brain.dart';
import 'package:health_caluclator/result_body_fat.dart';

import 'bmi_input_page.dart';
import 'icon_content.dart';
import 'myContainer.dart';

class Body_fat_input extends StatefulWidget {
  const Body_fat_input({Key? key}) : super(key: key);

  @override
  State<Body_fat_input> createState() => _Body_fat_inputState();
}
const Color inactiveColor = Color(0XFF424354);
const Color activeColor = Color(0XFF111328);

int height= 180;
int weight= 55;
int waist= 40;
int age= 20;
int neck= 5;
int fat_gender=0;


String men_20_40= 'Underfat: under 8 %\nHealthy: 8-19 %\nOverweight: 19-25 %\nObese: over 25 %';

String men_41_60= 'Underfat: under 11 %\nHealthy: 11-22 %\nOverweight: 22-27 %\nObese: over 27 %';

String men_61_79= 'Underfat: under 13 %\nHealthy: 13-25 %\nOverweight: 25-30 %\nObese: over 30 %';

String women_20_40= 'Underfat: under 21 %\nHealthy: 21-33 %\nOverweight: 33-39 %\nObese: Over 39 %';

String women_41_60= 'Underfat: under 23 %\nHealthy: 23-35 %\nOverweight : 35-40 %\nObese: over 40 %';

String women_61_79= 'Underfat: under 24 %\nHealthy: 24-36 %\nOverweight: 36-42 %\nObese: over 42 %';


enum Gender {
  male,
  female,
}

class _Body_fat_inputState extends State<Body_fat_input> {

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
        title: Text('BODY FAT'),
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
                            fat_gender=1;
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
                            fat_gender=2;
                          });
                        },
                      ),
                    ],
                  )), // first part

              Row(
                children: [
                  myContainer(
                    onpress: (){
                      print('middle part');
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
                    ), // height
                  ),
                  myContainer(
                    onpress: (){
                      print('middle part');
                    },
                    colour: Color(0XFF111328),
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('WAIST(At Navel)', textAlign: TextAlign.center,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(waist.toString(), style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900),textAlign: TextAlign.center,),

                            Text('cm',textAlign: TextAlign.justify,)
                          ],
                        ),
                        Slider(
                            value: waist.toDouble(),
                            min: 25.0,
                            max: 100.0,
                            activeColor: Color(0XFFEB1555),
                            inactiveColor: Color(0XFFBDBE98),
                            onChanged: (double newvalue){
                              setState(() {
                                waist= newvalue.round();
                              });

                            }

                        )
                      ],
                    ), // waist
                  ),
                ],
              ),// middle part

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
                                    child: Icon(Icons.remove, color: Colors.white,),
                                    onPressed: (){
                                      setState(() {
                                        weight= weight-1;
                                      });
                                    }

                                ),
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
                            Text('AGE(Age must be greater than 20)', textAlign: TextAlign.center,),
                            Text(age.toString(), style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900),textAlign: TextAlign.center,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FloatingActionButton(
                                    backgroundColor: inactiveColor,
                                    elevation: 2000.0,
                                    child: Icon(Icons.remove, color: Colors.white,),
                                    onPressed: (){
                                      setState(() {
                                        age= age-1;
                                        if(age<20){
                                          age= age+2;
                                        }
                                      });
                                    }

                                ),
                                FloatingActionButton(
                                    backgroundColor: inactiveColor,
                                    elevation: 20.0,
                                    child: Icon(Icons.add, color: Colors.white,),
                                    onPressed: (){
                                      setState(() {
                                        age= age+1;
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

                  setState(() {
                    Fat_calculate_brain fcb= Fat_calculate_brain(height, weight, waist, age, fat_gender);

                    if(fat_gender==1){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>

                            Result_body_fat(fcb.calculate_fat(), fcb.get_vichar()),
                        ),
                      );
                    }
                    else if(fat_gender==2){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            Result_body_fat(fcb.calculate_fat(), fcb.get_vichar()),
                        ),
                      );
                    }

                    else{
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            Result_body_fat(fcb.calculate_fat(), fcb.get_vichar()),
                        ),
                      );
                    }
                  });
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 5.0),
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'GET FAT PERCENTAGE',
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
