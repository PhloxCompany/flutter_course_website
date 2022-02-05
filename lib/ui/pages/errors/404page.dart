import 'package:flutter/material.dart';

class Page404 extends StatelessWidget {
  const Page404({Key? key}) : super(key: key);

  static const routeName = '/404';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("404"),
      ),
    );
  }
}
