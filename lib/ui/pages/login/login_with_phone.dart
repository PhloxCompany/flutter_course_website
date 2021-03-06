import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/global_setting_provider.dart';
import 'package:flutter_course_phlox/utils/colors.dart';
import 'package:flutter_course_phlox/utils/utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../../controller/providers/login_and_enter_code_provider.dart';
import '../../widgets/animate/phlox_anime.dart';
import '../../widgets/text/bold_text.dart';
import '../../widgets/text/extra_bold_text.dart';

class LoginWithPhoneUi extends StatefulWidget {
  const LoginWithPhoneUi({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<LoginWithPhoneUi> createState() => _LoginWithPhoneUiState();
}

class _LoginWithPhoneUiState extends State<LoginWithPhoneUi>
    with SingleTickerProviderStateMixin {
  bool selected = false;
  AnimationController? _controller;

  late LoginAndEnterCodeProvider _loginAndEnterCodeProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loginAndEnterCodeProvider =
        Provider.of<LoginAndEnterCodeProvider>(context);
  }

  @override
  void dispose() {
    _controller!.dispose();
    _loginAndEnterCodeProvider.sendCode = false;
    _loginAndEnterCodeProvider.start = 60;
    _loginAndEnterCodeProvider.cancelTimer();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<LoginAndEnterCodeProvider>().sendCode = false;
    context.read<LoginAndEnterCodeProvider>().sendAgainCode = false;
    context.read<LoginAndEnterCodeProvider>().loginAndEnterCodeRequest = false;
    context.read<LoginAndEnterCodeProvider>().enterCodeController.clear();
    context.read<LoginAndEnterCodeProvider>().loginController.clear();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(seconds: 3),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller!.forward();
        }
      });
    _controller?.forward();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    LoginAndEnterCodeProvider loginAndEnterCodeProvider = Provider.of(context);
    bool _isWeb = width >= 1024;

    GlobalSettingProvider settingProvider = Provider.of(context, listen: false);
    return Directionality(
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
                  margin: EdgeInsets.all(_isWeb ? 32 : 16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: settingProvider.darkMode
                        ? AppColors.blueBg
                        : Colors.amber.shade50,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        offset: const Offset(0, 0),
                        color: settingProvider.darkMode
                            ? AppColors.blueBg
                            : Colors.grey.shade700,
                        blurRadius: 90,
                      ),
                    ],
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    ),
                    image: settingProvider.darkMode
                        ? null
                        : const DecorationImage(
                            image: AssetImage(
                              'assets/images/test_background.png',
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
                              ExtraBoldText(
                                text: !loginAndEnterCodeProvider.sendCode
                                    ? "?????? ?????? ????????"
                                    : '???? ???? ???????? ????????',
                                textSize: _isWeb ? 82 : 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BoldText(
                                text: '???????? ???????? ???????????? ???????? ???????? ???????? ????????!',
                                color: const Color(0xFF616161),
                                textSize: _isWeb ? 18 : 14,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: loginAndEnterCodeProvider.sendCode ==
                                        false
                                    ? TextField(
                                        controller: loginAndEnterCodeProvider
                                            .loginController,
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
                                          labelStyle: const TextStyle(
                                              color: Colors.grey),
                                          labelText: '?????????? ????????',
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            fieldHeight: 50,
                                            fieldWidth: 40,
                                            inactiveColor: Colors.grey,
                                            selectedFillColor:
                                                Colors.transparent,
                                            inactiveFillColor:
                                                Colors.transparent,
                                            fieldOuterPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            activeFillColor: Colors.transparent,
                                          ),
                                          animationDuration:
                                              const Duration(milliseconds: 300),
                                          enableActiveFill: true,
                                          onChanged: (value) {
                                            loginAndEnterCodeProvider
                                                .enterCodeController
                                                .text = value;
                                          },
                                          onCompleted: (v) {
                                            if (loginAndEnterCodeProvider
                                                    .sendCode ==
                                                true) {
                                              loginAndEnterCodeProvider
                                                  .enterCodeController.text = v;
                                              _controller!.stop();

                                              loginAndEnterCodeProvider
                                                  .enterCodeRequest(context, v);
                                              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('???????? ???????????? ???????????? ???? ???????? ${loginAndEnterCodeProvider.start %
                                              //     60} : ${loginAndEnterCodeProvider.start ~/ 60} ?????? ????????')));
                                            }
                                          },
                                          beforeTextPaste: (text) {
                                            debugPrint(
                                                "Allowing to paste $text");
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
                              !loginAndEnterCodeProvider
                                      .loginAndEnterCodeRequest
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        minWidth:
                                            MediaQuery.of(context).size.width,
                                        height: 62,
                                        color: const Color(0xff2d3653),
                                        onPressed: () async {
                                          if (!loginAndEnterCodeProvider
                                              .sendCode) {
                                            loginAndEnterCodeProvider
                                                .loginPhoneRequest();
                                            return;
                                          }
                                          if (loginAndEnterCodeProvider
                                              .enterCodeController
                                              .text
                                              .isEmpty) {
                                            Utils.showToast(
                                                '???????? ???? ???????????? ???? ???????? ????????????');
                                            return;
                                          }
                                          if (loginAndEnterCodeProvider
                                                  .enterCodeController
                                                  .text
                                                  .length !=
                                              5) {
                                            Utils.showToast(
                                                '???? ???????????? ???????????? ??????');
                                            return;
                                          }
                                        },
                                        child: Text(
                                          loginAndEnterCodeProvider.sendCode ==
                                                  false
                                              ? '?????????? ????'
                                              : '?????????? ????',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                              Text(
                                loginAndEnterCodeProvider.sendCode == false
                                    ? ''
                                    : '${loginAndEnterCodeProvider.start % 60} : ${loginAndEnterCodeProvider.start ~/ 60}',
                                style: const TextStyle(color: Colors.grey),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14)),
                                  minWidth: double.infinity,
                                  height: 62,
                                  onPressed: () {
                                    loginAndEnterCodeProvider.sendCode = false;
                                    loginAndEnterCodeProvider.start = 60;
                                    loginAndEnterCodeProvider.cancelTimer();
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    '????????????',
                                    style: TextStyle(
                                        color: settingProvider.darkMode
                                            ? Colors.blueGrey.shade50
                                            : const Color(0xff2d3653)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (_isWeb)
                        Expanded(
                            child: AnimatedBuilder(
                                builder: (BuildContext context, Widget? child) {
                                  return Transform.translate(
                                    offset: Offset(0, _controller!.value * 8),
                                    child: child,
                                  );
                                },
                                animation: _controller!,
                                child: Image.asset(
                                    'assets/images/bakground_login.png'))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
