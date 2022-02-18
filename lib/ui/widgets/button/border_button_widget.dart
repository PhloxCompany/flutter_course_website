import 'package:flutter/material.dart';

class BorderButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const BorderButtonWidget(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontFamily: 'sans_bold'),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: Colors.black, width: .8)),
    );
  }
}
