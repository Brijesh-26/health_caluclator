
import 'package:flutter/material.dart';
import 'package:health_caluclator/myContainer.dart';


Color result_weight_color= Colors.green;
Color result_page_color= Color(0XFF424354);

class Result extends StatelessWidget  {

  final String result_weight;

  Result({required this.result_weight,required this.result_BMI,required this.final_result});

  final String result_BMI;
  final String final_result;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text('Your Result', style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900),)),
          Expanded(
            child: myContainer(
              colour: result_page_color,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result_weight.toUpperCase(), style: TextStyle(color: result_weight_color, fontWeight: FontWeight.w900),),
                  Text(result_BMI, style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900),),

                  Text(final_result, style: TextStyle(fontWeight: FontWeight.w900), ),

                ],
              ),

              onpress: (){

              },
            ),

          ),

          FlatButton(
              padding: EdgeInsets.all(20.0),
              onPressed: (){

                Navigator.pop(context);
              },
              color: Colors.red,
              child: Text('RECALCULATE', style: TextStyle(color: Colors.white),)
          )
        ],
      ),
    );
  }

}
