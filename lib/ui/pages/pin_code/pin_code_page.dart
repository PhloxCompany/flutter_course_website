import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/global_setting_provider.dart';
import 'package:flutter_course_phlox/controller/providers/login_and_enter_code_provider.dart';
import 'package:flutter_course_phlox/ui/widgets/animate/phlox_anime.dart';
import 'package:flutter_course_phlox/utils/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math; // import this
import '../../../utils/links.dart';
import '../../widgets/text/sign_deatils_button.dart';

class PinCode extends StatelessWidget {
  const PinCode({Key? key}) : super(key: key);
  static const routeName = '/pin_code';

  @override
  Widget build(BuildContext context) {

    GlobalSettingProvider settingProvider = Provider.of(context,listen: false);
    double width = MediaQuery
        .of(context)
        .size
        .width;
    LoginAndEnterCodeProvider pinCodeProvider = Provider.of(context);
    bool _isWeb = width >= 1024;
    return WillPopScope(
      onWillPop: () async{
        pinCodeProvider.sendCode = false;
        pinCodeProvider.start = 60;
        pinCodeProvider.timer!.cancel();
        Navigator.pop(context);
        return true;
      },
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: settingProvider.darkMode
          ? AppColors.blueBgDark
              : Colors.amber.shade50,
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
                      color: settingProvider.darkMode
                    ? AppColors.blueBgDark
                        : Colors.amber.shade50,
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
                                  style: TextStyle(fontSize: 24),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'لطفا شماره تلفنی را که برای ثبت نام داده اید\nرا وارد نمایید',
                                  style: TextStyle(fontSize: 14, color: Colors.grey),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: pinCodeProvider.sendCode == false
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
                                        debugPrint("Completed");
                                      },
                                      onChanged: (value) {},
                                      beforeTextPaste: (text) {
                                        debugPrint("Allowing to paste $text");
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
                                  const EdgeInsets.symmetric(horizontal: 20.0),
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

                                      if(pinCodeProvider.sendCode == true){
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('برای دریافت دوباره کد باید ${pinCodeProvider.start %
                                            60} : ${pinCodeProvider.start ~/ 60} صبر کنید')));
                                        return;
                                      }

                                      if (pinCodeProvider.sendCode == false) {

                                        pinCodeProvider.isSentCode(
                                            !pinCodeProvider.sendCode);
                                        pinCodeProvider.start = 60;
                                        pinCodeProvider.startTimer();
                                        //Navigator.pop(context);
                                      }
                                    },
                                    child: Text(
                                      pinCodeProvider.sendCode == false
                                          ? 'ارسال کد'
                                          : 'تایید کد',
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Text(
                                  pinCodeProvider.sendCode == false
                                      ? ''
                                      : '${pinCodeProvider.start %
                                      60} : ${pinCodeProvider.start ~/ 60}',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                if(_isWeb != true)
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14)
                                    ),
                                    minWidth: double.infinity,
                                    height: 62,
                                    onPressed: () async {
                                      pinCodeProvider.sendCode = false;
                                      pinCodeProvider.start = 60;
                                      pinCodeProvider.timer!.cancel();
                                      Navigator.pop(context);
                                      },
                                    child: const Text(
                                      'بازگشت',
                                      style: TextStyle(color: Color(0xff2d3653)),
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


                                  SignDetailsButton(
                                    valueTitle: '',
                                    valueDescription: "",
                                    valueTextButton: "بازگشت",
                                    onPressed: (){
                                      pinCodeProvider.sendCode = false;
                                      pinCodeProvider.start = 60;
                                      pinCodeProvider.timer!.cancel();
                                      Navigator.pop(context);
                                    },
                                  ),


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
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
