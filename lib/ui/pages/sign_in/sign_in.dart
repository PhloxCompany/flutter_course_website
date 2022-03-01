import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/home_provider.dart';
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
                                  borderRadius: const BorderRadius.only(topRight: Radius.circular(22)),
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
                                    right: 0,
                                    left: 120,
                                    onPressed: (){}),
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(22)),
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
                                style: TextStyle(fontSize: 22),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'بیایید همه شما را آماده کنیم تا بتوانید\nاولین تجربه ورود خود را ایجاد کنید',
                                style: TextStyle(fontSize: 18, color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
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
                                const EdgeInsets.symmetric(horizontal: 30.0),
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
                                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14)
                                  ),
                                  minWidth: MediaQuery.of(context).size.width,
                                  height: 62,
                                  color: const Color(0xff2d3653),
                                  onPressed: () {},
                                  child: const Text(
                                    'وارد شدن',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                  margin: EdgeInsets.all(_isWeb ? 0 : 20),
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(22),
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
                      width: 4,
                      color: Colors.white,
                    ),
                    image:  const DecorationImage(
                        image: NetworkImage(
                          '${Links.filesUrl}/bg.jpg',
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
