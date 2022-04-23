import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/global_setting_provider.dart';
import 'package:flutter_course_phlox/controller/providers/home_provider.dart';
import 'package:flutter_course_phlox/controller/providers/login_and_enter_code_provider.dart';
import 'package:flutter_course_phlox/ui/pages/errors/page404.dart';
import 'package:flutter_course_phlox/ui/pages/pin_code/pin_code_page.dart';
import 'package:flutter_course_phlox/ui/pages/sign_in/sign_in.dart';
import 'package:flutter_course_phlox/ui/pages/sign_up/sign_up.dart';
import 'package:flutter_course_phlox/ui/pages/login/login_with_phone.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

import 'ui/pages/home_page/home_page.dart';
import 'ui/pages/sign_up/sign_up.dart';

void main() async {
  setPathUrlStrategy();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  runApp(_Providers(preferences: preferences));
}

class _Providers extends StatelessWidget {
  final SharedPreferences preferences;

  const _Providers({Key? key, required this.preferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GlobalSettingProvider(preferences),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(context),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginAndEnterCodeProvider(context),
        ),
      ],
      child: const _MyApp(),
    );
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
      LoginWithPhoneUi.routeName: (context) => const LoginWithPhoneUi(),
    };
    return Consumer<GlobalSettingProvider>(builder: (_, settingProvider, __) {

      return MaterialApp(
        title: 'Flutter course | Phlox company',
        debugShowCheckedModeBanner: false,
        themeMode: settingProvider.darkMode
                ? ThemeMode.dark
                : ThemeMode.light,
        darkTheme: ThemeData(
          fontFamily: 'sans',
          primarySwatch: Colors.blueGrey,
          brightness: Brightness.dark,
        ),
        theme: ThemeData(
          fontFamily: 'sans',
          primarySwatch: Colors.blueGrey,
          brightness: Brightness.light,
        ),
        routes: _routes,
        initialRoute: HomePage.routeName,
        onGenerateRoute: (settings) {
          //
          // print(settings);
          // print(settings.name);
          // print(settings.arguments);

          if (_routes.keys.contains(settings.name)) {
            Navigator.pushNamed(context, settings.name!);
            return null;
          } else {
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
    });
  }
}
