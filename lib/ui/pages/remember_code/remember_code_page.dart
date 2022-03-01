import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/remember_code_provider.dart';
import 'package:flutter_course_phlox/ui/widgets/animate/phlox_anime.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math; // import this
import '../../../utils/links.dart';

class RememberCode extends StatelessWidget {
  const RememberCode({Key? key}) : super(key: key);
  static const routeName = '/remember_code';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    RememberCodeProvider rememberCodeProvider = Provider.of(context);
    bool _isWeb = width >= 1024;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.amber[50],
          body: Center(
            child: SingleChildScrollView(
              child: PhloxAnime(
                millisecondsDelay: 300,
                child: Container(
                  width: _isWeb ? 1024 : double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: PhloxAnime(
                          millisecondsDelay: 700,

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'پسوورد خود را فراموش کرده اید؟',
                                style: TextStyle(fontSize: 22),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'لطفا شماره تلفنی را که برای ثبت نام داده اید\nرا وارد نمایید',
                                style: TextStyle(fontSize: 18, color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                                child: rememberCodeProvider.sendCode == false
                                    ? TextField(
                                  keyboardType: TextInputType.number,
                                  maxLength: 11,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        )),
                                    labelStyle:
                                    const TextStyle(color: Colors.grey),
                                    labelText: 'شماره تلفن',
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                        )),
                                    contentPadding:
                                    const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 20),
                                  ),
                                )
                                    : Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: PinCodeTextField(
                                    length: 5,
                                    obscureText: false,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    animationType: AnimationType.fade,
                                    cursorColor: Colors.black,
                                    pinTheme: PinTheme(
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(5),
                                      fieldHeight: 50,
                                      fieldWidth: 40,
                                      inactiveColor: Colors.grey,
                                      selectedFillColor: Colors.transparent,
                                      inactiveFillColor: Colors.transparent,
                                      fieldOuterPadding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      activeFillColor: Colors.transparent,
                                    ),
                                    animationDuration:
                                    const Duration(milliseconds: 300),
                                    enableActiveFill: true,
                                    onCompleted: (v) {
                                      print("Completed");
                                    },
                                    onChanged: (value) {},
                                    beforeTextPaste: (text) {
                                      print("Allowing to paste $text");
                                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                      return true;
                                    },
                                    appContext: context,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14)),
                                  minWidth: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  height: 62,
                                  color: const Color(0xff2d3653),
                                  onPressed: () {
                                    if (rememberCodeProvider.sendCode == false) {
                                      rememberCodeProvider.isSentCode(
                                          !rememberCodeProvider.sendCode);
                                      rememberCodeProvider.start = 60;
                                      rememberCodeProvider.startTimer();
                                    }
                                  },
                                  child: Text(
                                    rememberCodeProvider.sendCode == false
                                        ? 'ارسال کد'
                                        : 'تایید کد',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Text(
                                rememberCodeProvider.sendCode == false
                                    ? ''
                                    : '${rememberCodeProvider.start %
                                    60} : ${rememberCodeProvider.start ~/ 60}',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (_isWeb)
                        Expanded(
                          child: PhloxAnime(
                            millisecondsDelay: 700,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(22)),
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationX(math.pi),
                                    child: Image.network(
                                        'https://api.phloxcompany.com/flutter_course/files/shape_bottom.png'),
                                  ),
                                ),
                                SizedBox(width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Image.asset(
                                      'assets/images/spam.png',
                                      width: 190,
                                      height: 190,
                                      fit: BoxFit.cover,
                                  ),
                                    ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text('در صورت ارسال نشدن کد\nبه بخش spam مراجعه کنید',
                                        style: TextStyle(color: Colors.grey[700]!),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                                //SizedBox(
                                //     width: double.infinity,
                                //     height: 240,
                                //     child: rememberCodeProvider.sendCode == true
                                //         ? SizedBox(
                                //       width: 40,
                                //           height: ,
                                //           child: ClipRRect(
                                //               borderRadius:
                                //                   BorderRadius.circular(12),
                                //               child: Image.asset(
                                //                 'assets/images/spam.png',
                                //                 width: 100,
                                //                 fit: BoxFit.cover,
                                //                 height: 200,
                                //               )),
                                //         )
                                //        : const SizedBox()
                                //
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 60.0),
                                //   child: Align(
                                //     alignment: Alignment.topLeft,
                                //     child: Column(
                                //       crossAxisAlignment: CrossAxisAlignment.center,
                                //       mainAxisAlignment: MainAxisAlignment.start,
                                //       children: [
                                //         const SizedBox(
                                //           height: 20,
                                //         ),
                                //         const Text(
                                //           'پسورد خود را به یاد اوردید؟',
                                //           style: TextStyle(fontSize: 18),
                                //         ),
                                //         const SizedBox(
                                //           height: 12,
                                //         ),
                                //         const Text(
                                //           'بازگشت به صفحه ورود',
                                //           style: TextStyle(color: Colors.grey),
                                //         ),
                                //         const SizedBox(
                                //           height: 14,
                                //         ),
                                //         Padding(
                                //           padding: const EdgeInsets.only(left: 28.0),
                                //           child: MaterialButton(
                                //             minWidth: 150,
                                //             shape: RoundedRectangleBorder(
                                //                 borderRadius: BorderRadius.circular(10)
                                //             ),
                                //             height: 56,
                                //             color: const Color(0xff2d3653),
                                //             onPressed: () {},
                                //             child: const Text(
                                //               'بازگشت',
                                //               style: TextStyle(color: Colors.white),
                                //             ),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),

                                ClipRRect(
                                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(22)),
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationX(math.pi),
                                    child: Image.network(
                                        'https://api.phloxcompany.com/flutter_course/files/shape_top.png'),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
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
        ));
  }
}
