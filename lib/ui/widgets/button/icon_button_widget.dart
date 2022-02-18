import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {

  final VoidCallback? voidCallback;
  final IconData icon;

  const IconButtonWidget({Key? key, this.voidCallback, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: CircleBorder(
        side: BorderSide(color: Colors.amber.shade100, width: 1),
      ),
      margin: const EdgeInsets.all(8.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 24,
      color: Colors.white,
      child: InkWell(
        onTap: voidCallback,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon),
        ),
      ),
    );
  }
}
