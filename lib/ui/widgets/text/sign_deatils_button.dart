import 'package:flutter/material.dart';

class SignDetailsButton extends StatelessWidget {
  final String valueTitle;
  final String valueDescription;
  final String valueTextButton;
  final VoidCallback onPressed;

  const SignDetailsButton(
      {Key? key,
      required this.valueTitle,
      required this.valueDescription,
      required this.valueTextButton,
      required this.onPressed,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 256,
      child: Center(
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
