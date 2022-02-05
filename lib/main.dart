import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/ui/pages/errors/404page.dart';
import 'package:flutter_course_phlox/ui/pages/sign_in/sign_in.dart';

import 'ui/pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        SignIn.routeName: (context) => const SignIn(),
        Page404.routeName: (context) => const Page404(),
      },
      initialRoute: HomePage.routeName,
      onGenerateRoute: (settings) {
        if (settings.name == HomePage.routeName) {
          // Cast the arguments to the correct
          // type: ScreenArguments.
          final args = settings.arguments as ScreenArguments;

          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return const HomePage();
            },
          );
        }
        if (settings.name == SignIn.routeName) {
          // Cast the arguments to the correct
          // type: ScreenArguments.
          final args = settings.arguments as ScreenArguments;

          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return const SignIn();
            },
          );
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

// You can pass any object to the arguments parameter.
// In this example, create a class that contains both
// a customizable title and message.
class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
