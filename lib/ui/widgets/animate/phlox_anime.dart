import 'package:flutter/material.dart';
import 'package:phlox_animations/phlox_animations.dart';

class PhloxAnime extends StatelessWidget {
  final Widget child;
  final int millisecondsDelay;
  final PhloxAnimationsController? phloxAnimationsController;

  const PhloxAnime(
      {Key? key, required this.child, required this.millisecondsDelay , this.phloxAnimationsController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhloxAnimations(

        controller: phloxAnimationsController,
        duration: const Duration(milliseconds: 900),
        fromY: -60,
        toY: 0,
        fromOpacity: 0,
        wait: Duration(milliseconds: millisecondsDelay),
        toOpacity: 1,
        child: child);
  }
}
