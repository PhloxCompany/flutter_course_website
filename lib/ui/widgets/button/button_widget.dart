import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;
  final Color color;

  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.child,
    this.backgroundColor = Colors.black,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: color,
      child: child,
      elevation: 32,
      padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}
