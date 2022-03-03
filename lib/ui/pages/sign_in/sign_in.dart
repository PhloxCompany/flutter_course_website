import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/home_provider.dart';
import 'package:flutter_course_phlox/ui/pages/pin_code/pin_code_page.dart';
import 'package:flutter_course_phlox/ui/pages/sign_up/sign_up.dart';
import 'package:flutter_course_phlox/ui/widgets/animate/phlox_anime.dart';
import 'package:provider/provider.dart';

import '../../../utils/links.dart';
import 'dart:math' as math;

import '../../widgets/text/sign_deatils_button.dart'; // import this


class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  static const routeName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1024;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor:  Colors.amber[50],
          body: Center(
            child: SingleChildScrollView(
              child: PhloxAnime(
                millisecondsDelay: 300,
                child: Container(
                  constraints: const BoxConstraints(minHeight: 640),
                  width: _isWeb ? 1024 : double.infinity,
                  margin: EdgeInsets.all (_isWeb ? 32 : 16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.amber[50],
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        offset: const Offset(0, 0),
                        color: Colors.grey[600]!,
                        blurRadius: 90,
                      ),
                    ],
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    ),
                    image:  const DecorationImage(
                        image: NetworkImage(
                          '${Links.filesUrl}/bg.jpg',
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Row(
                    children: [
                      if (_isWeb)
                        Expanded(
                          child: PhloxAnime(
                            millisecondsDelay: 700,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(topRight: Radius.circular(24)),
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(math.pi),
                                    child: Image.network(
                                        'https://api.phloxcompany.com/flutter_course/files/shape_top.png'),
                                  ),
                                ),
                                SignDetailsButton(
                                    valueTitle: 'ثبت نام نکرده اید؟',
                                    valueDescription: "به انجمن فلوکس بپیوندید و لذت ببرید",
                                    valueTextButton: "ثبت نام",
                                    onPressed: ()=> Navigator.pushReplacementNamed(context, SignUp.routeName), ),
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(24)),
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(math.pi),
                                    child: Image.network(
                                        'https://api.phloxcompany.com/flutter_course/files/shape_bottom.png'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                      Expanded(
                        child: PhloxAnime(
                          millisecondsDelay: 700,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'ورود به حساب کاربری',
                                style: TextStyle(fontSize: 24),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'زندگی در علم است و آسودگی در دانستن\nبرای دیدن جزئیات حساب خود، وارد شوید!',
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextField(
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        )),
                                    labelStyle: const TextStyle(color: Colors.grey),
                                    labelText: 'نام و نام خانوادگی',
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        )),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 20),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextField(
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        )),
                                    labelStyle: const TextStyle(color: Colors.grey),
                                    labelText: 'پسورد',
                                    suffixIcon: IconButton(
                                      onPressed: (){},
                                      icon: const Icon(Icons.visibility),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        )),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 20),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14)
                                  ),
                                  minWidth: MediaQuery.of(context).size.width,
                                  height: 62,
                                  color: const Color(0xff2d3653),
                                  onPressed: () {},
                                  child: const Text(
                                    'ورود',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              if(!_isWeb) Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14)
                                      ),
                                      minWidth: double.infinity,
                                      height: 62,
                                      onPressed: ()=> Navigator.pushReplacementNamed(context, SignUp.routeName),
                                      child: const Text(
                                        'اکانت دارید ؟ وارد شوید.',
                                        style: TextStyle(color: Color(0xff2d3653)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14)
                                  ),
                                  minWidth: double.infinity,
                                  height: 62,
                                    onPressed: () async {
                                      var result = await Navigator.pushNamed(context, PinCode.routeName);
                                    },
                                  child: const Text(
                                    'رمز خود را فراموش کرده اید ؟',
                                    style: TextStyle(color: Color(0xff2d3653)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
