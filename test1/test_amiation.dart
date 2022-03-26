import 'package:flutter/material.dart';

class TestAnimationPage extends StatefulWidget {
  const TestAnimationPage({Key? key}) : super(key: key);

  @override
  State<TestAnimationPage> createState() => _TestAnimationPageState();
}

class _TestAnimationPageState extends State<TestAnimationPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)..addListener(() {

    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
