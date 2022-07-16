import 'package:flutter/material.dart';

class myContainerChild extends StatelessWidget {

  Icon icon; String name;
  myContainerChild({ required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround ,
      children: [
        icon,
        Text('$name', style: TextStyle(fontSize: 25.0),)
      ],
    );
  }
}