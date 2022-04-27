import 'package:flutter/material.dart';

class ExtraBoldText extends StatelessWidget {
  final String text;
  final double textSize;
  final int? maxLine;

  const ExtraBoldText({Key? key, required this.text, this.textSize = 18 , this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      maxLines: maxLine,
      style: TextStyle(
        fontFamily: 'bold',
        fontSize: textSize,
    ),);
  }
}
