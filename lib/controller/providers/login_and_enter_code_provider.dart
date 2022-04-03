import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_course_phlox/utils/show_toast.dart';

import '../request_controller.dart';

class LoginAndEnterCodeProvider extends ChangeNotifier{

  bool sendCode = false;

  bool sendAgainCode = false;
  bool loginAndEnterCodeRequest = false;
  TextEditingController loginController = TextEditingController();
  TextEditingController enterCodeController = TextEditingController();

  void isSentCode(value){
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
          print('${start ~/ 60} : ${start % 60}');
          start--;
          notifyListeners();
        }
      },
    );
  }


  Future<void> loginPhoneRequest() async {

    if(loginController.text.isEmpty){
      Utils.showToast('لطفا شماره خود را وارد نمایید');
      return;
    }

    if(loginController.text.length != 11){
      Utils.showToast('شماره شما اشتباه است');
      return;
    }

    if (sendCode == false && loginController.text.isNotEmpty) {
      loginAndEnterCodeRequest = true;
      notifyListeners();
      Response response =
      await RequestController.dio.post("login_phone.php?api=phone" , data: FormData.fromMap({
        'phone' : loginController.text
      }));
      debugPrint(response.data);
      if (response.statusCode == 200) {
        var data = json.decode(response.data);
        if(data['result']){
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


  Future<void> enterCodeRequest(BuildContext context,value) async {
    loginAndEnterCodeRequest = true;
    notifyListeners();
    Response response =
    await RequestController.dio.post("login_phone.php?api=code" , data: FormData.fromMap({
      'code' : value,
      'phone' : loginController.text
    }));
    debugPrint(response.data);
    if (response.statusCode == 200) {
      var data = json.decode(response.data);
      if(data['result']){
        isSentCode(!sendCode);
        start = 60;
        timer!.cancel();
        Navigator.pop(context);
      }
      Utils.showToast(data['msg']);
    }

    loginAndEnterCodeRequest = false;
    notifyListeners();
  }

  void cancelTimer() {
    if(timer != null){

      if(timer!.isActive){
        timer!.cancel();
      }
    }
  }

}