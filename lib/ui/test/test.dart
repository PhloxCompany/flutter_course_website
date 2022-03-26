/// Flutter code sample for AnimatedAlign

// The following code implements the [AnimatedAlign] widget, using a [curve] of
// [Curves.fastOutSlowIn].

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> with SingleTickerProviderStateMixin {
  bool selected = false;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    reverseDuration: const Duration(seconds: 3),
    vsync: this,
  )..addStatusListener((status) {
    if(status == AnimationStatus.completed){
      _controller.reverse();
    }else if(status == AnimationStatus.dismissed){
      _controller.forward();
    }
  }
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(0, _controller.value * 20),
          child: child,
        );
      },
    child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
        child: const Center(
        child: Text('Whee!'),
    )
    )
    );
  }
}
