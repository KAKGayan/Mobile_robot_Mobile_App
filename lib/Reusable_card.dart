import 'package:flutter/material.dart';

class Reusablecard extends StatelessWidget {
  Reusablecard({required this.colour, this.cardChild});
  final Color colour;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) { 
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 200.0,
      width: 200,
      child: cardChild,
    );
  }
}

