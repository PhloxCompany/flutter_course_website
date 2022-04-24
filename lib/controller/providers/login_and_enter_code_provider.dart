import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_course_phlox/controller/providers/global_setting_provider.dart';
import 'package:flutter_course_phlox/ui/pages/home_page/home_page.dart';
import 'package:flutter_course_phlox/utils/utils.dart';
import 'package:provider/provider.dart';

import '../api_service.dart';

class LoginAndEnterCodeProvider extends ChangeNotifier {
  ApiService? _apiService;

  LoginAndEnterCodeProvider(BuildContext context) {
    _apiService = ApiService(context);
  }

  bool sendCode = false;
  bool sendAgainCode = false;
  bool loginAndEnterCodeRequest = false;
  TextEditingController loginController = TextEditingController();
  TextEditingController enterCodeController = TextEditingController();

  void isSentCode(value) {
    sendCode = value;
    notifyListeners();
  }

  Timer? timer;
  int start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
          sendCode = false;
          notifyListeners();
        } else {
          start--;
          notifyListeners();
        }
      },
    );
  }

  Future<void> loginPhoneRequest() async {
    if (loginController.text.isEmpty) {
      Utils.showToast('لطفا شماره خود را وارد نمایید');
      return;
    }

    if (loginController.text.length != 11) {
      Utils.showToast('شماره شما اشتباه است');
      return;
    }

    if (sendCode == false && loginController.text.isNotEmpty) {
      loginAndEnterCodeRequest = true;
      notifyListeners();
      Response response = await ApiService.dio.post("login_phone.php?api=phone",
          data: FormData.fromMap({'phone': loginController.text}));
      debugPrint(response.data);
      if (response.statusCode == 200) {
        var data = json.decode(response.data);
        if (data['result']) {
          isSentCode(!sendCode);
          start = 60;
          startTimer();
        }
        Utils.showToast(data['msg']);
      }

      loginAndEnterCodeRequest = false;
      notifyListeners();
    }
  }

  Future<void> enterCodeRequest(BuildContext context, code) async {
    loginAndEnterCodeRequest = true;
    notifyListeners();

    _apiService!.post(
        url: "login_phone.php?api=code",
        body: {'code': code, 'phone': loginController.text},
        res: (data) {
          if (data['result']) {
            start = 60;
            timer!.cancel();
            context.read<GlobalSettingProvider>().setToken =
                data['token'].toString();
            Navigator.pushNamedAndRemoveUntil(
                context, HomePage.routeName, (route) => false);
          }else{
            loginAndEnterCodeRequest = false;
            notifyListeners();
          }
        });
  }

  void cancelTimer() {
    if (timer != null) {
      if (timer!.isActive) {
        timer!.cancel();
      }
    }
  }
}
