import 'package:flutter/material.dart';

class ExtraBoldText extends StatelessWidget {
  final String text;
  final double textSize;
  final Color color;

  const ExtraBoldText({Key? key, required this.text, this.textSize = 18, this.color = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        fontFamily: 'bold',
        fontSize: textSize,
        color: color,
    ),);
  }
}
