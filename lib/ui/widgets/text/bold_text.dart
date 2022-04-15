import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final String text;
  final double textSize;
  final Color? color;

  const BoldText({Key? key, required this.text, this.textSize = 18, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'sans_bold',
          fontSize: textSize,
          fontWeight: FontWeight.w100),
    );
  }
}
