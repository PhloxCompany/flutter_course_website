import 'package:flutter/material.dart';

class ButtonBlack extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final Color color;
  final EdgeInsets padding;

  const ButtonBlack({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = Colors.black,
    this.color = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: MaterialButton(
        onPressed: onPressed,
        textColor: color,
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'sans_bold',
          ),
        ),
        elevation: 32,
        padding: padding,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
