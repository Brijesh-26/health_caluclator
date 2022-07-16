import 'dart:math';

import 'package:flutter/cupertino.dart';

class BMI_calculator_brain{


  final int height;
  final int weight;




  BMI_calculator_brain({required this.height, required this.weight});

  String calculateBMI(){
    double bmi= weight/ pow(height/100, 2);

    return bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(double.parse(calculateBMI())>= 25) return 'Overweight';
    else if(double.parse(calculateBMI())>18.5) return 'Normal';
    else return 'Underweight';
  }


  String getBMIVichar(){
    if(double.parse(calculateBMI())>= 25) return 'People who are overweight or obese are at higher risk for chronic conditions such as high blood pressure, diabetes, and high cholesterol.';
    else if(double.parse(calculateBMI())>18.5) return 'Maintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity.';
    else return 'Talk with your healthcare provider to determine possible causes of underweight and if you need to gain weight.';
  }

}