import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  static const routeName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('sign in'),
      ),
    );
  }
}
