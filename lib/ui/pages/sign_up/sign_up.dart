import 'package:flutter/material.dart';

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
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 640
              ),
              width: _isWeb ? 1024 : double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'ثبت نام برای اکانت جدید',
                          style: TextStyle(fontSize: 22),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'بیایید همه شما را آماده کنیم تا بتوانید\nاولین تجربه ورود خود را ایجاد کنید',
                          style: TextStyle(fontSize: 18 , color: Colors.grey),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  if(_isWeb)
                  Expanded(
                    child: Column(
                      children: [],
                    ),
                  ),
                ],
              ),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 4,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(22)),
            ),
          ),
        ),
      ),
    );
  }
}
