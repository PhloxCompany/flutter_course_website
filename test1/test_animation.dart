import 'package:flutter/material.dart';
import 'package:phlox_animations/phlox_animations.dart';

void main()=> runApp(const MaterialApp(
  home: TestAnimation(),
));


class TestAnimation extends StatefulWidget {
  const TestAnimation({Key? key}) : super(key: key);
  static const routeName = '/test_animation';

  @override
  _TestAnimationState createState() => _TestAnimationState();
}

class _TestAnimationState extends State<TestAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Card(
        margin: EdgeInsets.zero,
        child: PhloxAnimations.custom(
          builder: (animations) {
            return Transform.translate(
              offset: Offset(animations.moveX! , animations.moveY!),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22)
                ),
                color: Colors.blueGrey,
                onPressed: () {
                  debugPrint('click');
                },
                child: const Text('Click Animation'),
              ),
            );
          },
          duration: const Duration(seconds: 1),
          toX: MediaQuery.of(context).size.width / 2,
          toY: MediaQuery.of(context).size.height / 2,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){},
      ),
    );
  }
}
