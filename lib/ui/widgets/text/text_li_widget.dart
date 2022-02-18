import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/ui/widgets/text/bold_text.dart';

class TextLiWidget extends StatelessWidget {

  final String text;
  const TextLiWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, size: 12,),
        SizedBox(width: 12,),
        Text(text),
      ],
    );
  }
}
