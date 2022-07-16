import 'package:flutter/material.dart';

class myContainer extends StatelessWidget {
  final Color colour; Widget cardChild;
  myContainer({required this.colour, required this.cardChild, required this.onpress});
  VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(

        onTap: onpress,
        child: Container(
          child: cardChild,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: colour
          ),
          margin: EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
