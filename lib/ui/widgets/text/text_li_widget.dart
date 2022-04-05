import 'package:flutter/material.dart';

class TextLiWidget extends StatelessWidget {

  final String text;
  const TextLiWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.circle, size: 12,),
        const SizedBox(width: 12,),
        Flexible(child: Text(text, softWrap: true,)),
      ],
    );
  }
}
