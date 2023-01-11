// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class MyTextView extends StatelessWidget {

  final String label;
  final Color color;
  final double fontSize;

  MyTextView(this.label,this.color,this.fontSize);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color,
        fontSize: fontSize
      ),
    );
  }
}