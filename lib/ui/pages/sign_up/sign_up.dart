import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/ui/pages/sign_in/sign_in.dart';
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
                millisecondsDelay: 300,
                child: Container(
                  constraints: const BoxConstraints(minHeight: 640),
                  width: _isWeb ? 1024 : double.infinity,
                  margin: EdgeInsets.all (_isWeb ? 32 : 16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: null,
                    border: Border.all(color: Colors.white, width: 1),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        offset: const Offset(0, 0),
                        color: Colors.grey[600]!,
                        blurRadius: 90,
                      ),
                    ],
                    image: const DecorationImage(
                        image: NetworkImage(
                          '${Links.filesUrl}/bg.jpg',
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: PhloxAnime(
                          millisecondsDelay: 700,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: _isWeb ? 68 : 32, vertical: 32),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                const Text(
                                  'ثبت نام برای اکانت جدید',
                                  style: TextStyle(fontSize: 24),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'بیایید شما را آماده کنیم تا بتوانید\nاولین تجربه ورود خود را بازار کار جهانی کسب کنید',
                                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
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
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
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
                                      'ثبت نام',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                if(!_isWeb)Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14)
                                    ),
                                    minWidth: double.infinity,
                                    height: 62,
                                    onPressed: () =>Navigator.pushReplacementNamed(context, SignIn.routeName),
                                    child: const Text(
                                      'اکانت دارید؟ وارد شوید.',
                                      style: TextStyle(color: Color(0xff2d3653)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (_isWeb)
                        Expanded(
                          flex: 2,
                          child: PhloxAnime(
                            millisecondsDelay: 700,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(24)),
                                  child: Image.network(
                                      'https://api.phloxcompany.com/flutter_course/files/shape_top.png'),
                                ),
                                SignDetailsButton(
                                    valueTitle: 'اکانت دارید؟',
                                    valueDescription: "برای ورود به حساب خود، وارد شوید",
                                    valueTextButton: "ورود",
                                    onPressed: () => Navigator.pushReplacementNamed(context, SignIn.routeName)),
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(24)),
                                  child: Image.network(
                                      'https://api.phloxcompany.com/flutter_course/files/shape_bottom.png'),
                                )
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
