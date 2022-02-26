import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/home_provider.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  static const routeName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of(context, listen: true);
    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1024;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Text('sign in'),
      ),
    );
  }
}
