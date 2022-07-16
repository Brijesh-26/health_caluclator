import 'package:flutter/material.dart';
import 'package:health_caluclator/splash.dart';

import 'blood_group_input.dart';
import 'body_fat_input.dart';
import 'bmi_input_page.dart';

void main() {
  runApp(HealthCalculator());
}




class HealthCalculator extends StatelessWidget {
  const HealthCalculator({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: 'splash',
      routes: {
        'splash': (context) => Splash(),
        'bmi': (context) => InputPage(),
        'blood': (context) => Blood_group_input(),
        'fat': (context) => Body_fat_input()
      },
    );
  }
}

