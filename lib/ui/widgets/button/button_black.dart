import 'package:flutter/material.dart';

class ButtonBlack extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final Color color;

  const ButtonBlack({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = Colors.black,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: color,
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'sans_bold',
        ),
      ),
      elevation: 32,
      padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}
