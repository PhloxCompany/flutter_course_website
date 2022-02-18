import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/ui/pages/errors/404page.dart';
import 'package:flutter_course_phlox/ui/pages/sign_in/sign_in.dart';

import 'ui/pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter course | Phlox company',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'sans',
        primarySwatch: Colors.blue,
      ),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        SignIn.routeName: (context) => const SignIn(),
        Page404.routeName: (context) => const Page404(),
      },
      initialRoute: HomePage.routeName,
      onGenerateRoute: (settings) {

        print(settings);
        print(settings.name);
        print(settings.arguments);

        switch(settings.name){
          case HomePage.routeName:{
            return MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            );
          }
          case SignIn.routeName:{
            return MaterialPageRoute(
              builder: (context) {
                return const SignIn();
              },
            );
          }
        }
        return MaterialPageRoute(
          builder: (context) {
            return const Page404();
          },
        );
      },
    );
  }
}
