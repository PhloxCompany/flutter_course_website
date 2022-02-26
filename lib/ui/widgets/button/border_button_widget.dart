import 'package:flutter/material.dart';

class BorderButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final EdgeInsets padding;

  const BorderButtonWidget(
      {Key? key, required this.onPressed, required this.text, this.padding = const EdgeInsets.symmetric(horizontal: 42, vertical: 20)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontFamily: 'sans_bold'),
        ),
        padding: padding,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(color: Colors.black, width: .8)),
      ),
    );
  }
}
