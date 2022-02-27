import 'package:flutter/material.dart';

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
              child: Container(
                constraints: const BoxConstraints(minHeight: 640),
                width: _isWeb ? 1024 : double.infinity,
                child: Row(
                  children: [
                    Expanded(
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
                    if (_isWeb)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(
                                  'https://api.phloxcompany.com/flutter_course/files/shape_top.png'),
                              SizedBox(
                                width: double.infinity,
                                height: 240,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 60.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'قبلا یک حساب کاربری دارید؟',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      const Text(
                                        'به انجمن فلوکس بپیوندید و لذت ببرید',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 28.0),
                                        child: MaterialButton(
                                          minWidth: 150,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                          height: 56,
                                          color: const Color(0xff2d3653),
                                          onPressed: () {},
                                          child: const Text(
                                            'وارد شدن',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Image.network(
                                  'https://api.phloxcompany.com/flutter_course/files/shape_bottom.png')
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
                    color: Colors.black,
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
        )
    );
  }
}
