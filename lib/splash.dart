import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

class Splash extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Health', style: TextStyle(fontFamily: 'DancingScript', fontSize: 80.0),),
            Text('Calculator', style: TextStyle(fontFamily: 'DancingScript', fontSize: 20.0),),
          ],
        ),
      ),

        floatingActionButton: FabCircularMenu(
            children: <Widget>[

              IconButton(icon: Icon(Icons.fitness_center,), onPressed: () {
                // go to bmi page

                Navigator.pushNamed(context, 'bmi');
              }),
              IconButton(icon: Icon(Icons.accessibility), onPressed: () {
                // go to fat page
                Navigator.pushNamed(context, 'fat');
              }),
              IconButton(icon: Icon(Icons.bloodtype), onPressed: () {
                // go to blood page
                Navigator.pushNamed(context, 'blood');
              }),
            ]
        )

    );
  }
}
