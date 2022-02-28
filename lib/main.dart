import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/home_provider.dart';
import 'package:flutter_course_phlox/controller/providers/remember_code_provider.dart';
import 'package:flutter_course_phlox/ui/pages/errors/404page.dart';
import 'package:flutter_course_phlox/ui/pages/remember_code/remember_code_page.dart';
import 'package:flutter_course_phlox/ui/pages/sign_in/sign_in.dart';
import 'package:flutter_course_phlox/ui/pages/sign_up/sign_up.dart';
import 'package:flutter_course_phlox/ui/pages/sign_up/sign_up.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'ui/pages/home_page/home_page.dart';
import 'ui/pages/sign_up/sign_up.dart';

void main() {
  setPathUrlStrategy();
  runApp(const _Providers());
}

class _Providers extends StatelessWidget {
  const _Providers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => HomeProvider(),),
      ChangeNotifierProvider(create: (context) => RememberCodeProvider(),),
    ], child: const MyApp(),);
  }
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
        primarySwatch: Colors.amber,
      ),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        SignUp.routeName: (context) => const SignUp(),
        RememberCode.routeName: (context) => const RememberCode(),
        SignIn.routeName: (context) => const SignIn(),
        Page404.routeName: (context) => const Page404(),
      },
      initialRoute: SignIn.routeName,
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
