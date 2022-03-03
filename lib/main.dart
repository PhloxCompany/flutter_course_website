import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/home_provider.dart';
import 'package:flutter_course_phlox/controller/providers/remember_code_provider.dart';
import 'package:flutter_course_phlox/ui/pages/errors/404page.dart';
import 'package:flutter_course_phlox/ui/pages/pin_code/pin_code_page.dart';
import 'package:flutter_course_phlox/ui/pages/sign_in/sign_in.dart';
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
      ChangeNotifierProvider(create: (context) => PinCodeProvider(),),
    ], child: const _MyApp(),);
  }
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    final Map<String, WidgetBuilder> _routes = {
      HomePage.routeName: (context) => const HomePage(),
      SignUp.routeName: (context) => const SignUp(),
      PinCode.routeName: (context) => const PinCode(),
      SignIn.routeName: (context) => const SignIn(),
      Page404.routeName: (context) => const Page404(),
    };
    return MaterialApp(
      title: 'Flutter course | Phlox company',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'sans',
        primarySwatch: Colors.blueGrey,
      ),
      routes: _routes,
      initialRoute: HomePage.routeName,
      onGenerateRoute: (settings) {
        //
        // print(settings);
        // print(settings.name);
        // print(settings.arguments);
        
        if(_routes.keys.contains(settings.name)){
          Navigator.pushNamed(context,  settings.name!);
          return null;
        }else{
          return MaterialPageRoute(
            maintainState: true,
            builder: (context) {
              return const Page404();
            },
          );
        }

        // switch(settings.name){
        //   case HomePage.routeName:{
        //     return MaterialPageRoute(
        //       maintainState: true,
        //       builder: (context) {
        //         return const HomePage();
        //       },
        //     );
        //   }
        //   case SignIn.routeName:{
        //     return MaterialPageRoute(
        //       maintainState: true,
        //       builder: (context) {
        //         return const SignIn();
        //       },
        //     );
        //   }
        // }
        // return MaterialPageRoute(
        //   maintainState: true,
        //   builder: (context) {
        //     return const Page404();
        //   },
        // );
      },
    );
  }
}
