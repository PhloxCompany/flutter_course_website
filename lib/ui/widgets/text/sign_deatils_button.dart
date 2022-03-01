import 'package:flutter/material.dart';
import 'dart:math' as math; // import this

class SignDetailsButton extends StatelessWidget {
  final String valueTitle;
  final String valueDescription;
  final String valueTextButton;
  final VoidCallback onPressed;
  final double? left;
  final double? right;

  const SignDetailsButton(
      {Key? key,
      required this.valueTitle,
      required this.valueDescription,
      required this.valueTextButton,
      required this.onPressed,
      required this.right,
      required this.left,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 256,
      child: Padding(
        padding: EdgeInsets.only(left: left! , right: right!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              valueTitle,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              valueDescription,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 14,
            ),
            MaterialButton(
              minWidth: 150,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              height: 56,
              color: const Color(0xff2d3653),
              onPressed: onPressed,
              child: Text(
                valueTextButton,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
