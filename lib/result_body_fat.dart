import 'package:flutter/material.dart';
import 'package:health_caluclator/bmi_input_page.dart';
import 'package:health_caluclator/body_fat_input.dart';

import 'myContainer.dart';


Color result_page_color= Color(0XFF424354);


class Result_body_fat extends StatelessWidget {

  String fat_percentage;
  String fat_vicahr;


  Result_body_fat(this.fat_percentage, this.fat_vicahr);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BODY FAT'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text('Your Body Fat(APPROX......)', style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900),)),
          Expanded(
            child: myContainer(
              colour: result_page_color,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(fat_percentage.toUpperCase(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.w900, fontSize: 40.0),),
                  Text(fat_vicahr, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),),
                  //
                  // Text(final_result, style: TextStyle(fontWeight: FontWeight.w900), ),

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
