import 'package:flutter/material.dart';

class Page404 extends StatelessWidget {
  const Page404({Key? key}) : super(key: key);

  static const routeName = '/error404';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("404"),
      ),
    );
  }
}
