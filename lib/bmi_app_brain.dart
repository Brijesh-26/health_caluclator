import 'package:flutter/material.dart';
import 'package:health_caluclator/blood_group_input.dart';
import 'package:health_caluclator/body_fat_input.dart';
import 'package:health_caluclator/main.dart';
import 'package:health_caluclator/splash.dart';

class App_brain extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'splash',
      routes: {
        'splash': (context) => Splash(),
        'bmi': (context) => HealthCalculator(),
        'blood': (context) => Blood_group_input(),
        'fat': (context) => Body_fat_input()
      },
    );
  }
}
