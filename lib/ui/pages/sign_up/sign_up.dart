import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/ui/widgets/animate/phlox_anime.dart';
import 'package:flutter_course_phlox/ui/widgets/text/sign_deatils_button.dart';

import '../../../utils/links.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  static const routeName = '/sign_up';

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
                millisecondsDelay: 1000,
                child: Container(
                  constraints: const BoxConstraints(minHeight: 640),
                  width: _isWeb ? 1024 : double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: PhloxAnime(
                          millisecondsDelay: 1500,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'ثبت نام برای اکانت جدید',
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
                                    hintText: 'احمد ذوقی',
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
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30.0),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  maxLength: 11,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        )),
                                    labelStyle: const TextStyle(color: Colors.grey),
                                    labelText: 'شماره تلفن',
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
                                    hintText: 'احمد ذوقی',
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
                                    hintText: 'احمد ذوقی',
                                    labelText: 'تکرار پسورد',
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
                                    'ثبت نام',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (_isWeb)
                        Expanded(
                          child: PhloxAnime(
                            millisecondsDelay: 1500,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(22)),
                                  child: Image.network(
                                      'https://api.phloxcompany.com/flutter_course/files/shape_top.png'),
                                ),
                                SignDetailsButton(
                                    valueTitle: 'ثبت نام نکرده اید؟',
                                    valueDescription: "به انجمن فلوکس بپیوندید و لذت ببرید",
                                    valueTextButton: "ثبت نام",
                                    right: 120,
                                    left: 0,
                                    onPressed: (){}),
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(22)),
                                  child: Image.network(
                                      'https://api.phloxcompany.com/flutter_course/files/shape_bottom.png'),
                                )
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  margin: EdgeInsets.all(_isWeb ? 0 : 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: null,
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
                    image: const DecorationImage(
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
