import 'package:flutter/material.dart';

class Controlcard extends StatelessWidget {
  Controlcard({this.controlchild,required this.colour});
  final Color colour;
  final Widget? controlchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: controlchild,
    );
  }
}
