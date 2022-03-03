import 'dart:async';

import 'package:flutter/cupertino.dart';

class PinCodeProvider extends ChangeNotifier{

  bool sendCode = false;

  void isSentCode(value){
    sendCode = value;
    notifyListeners();
  }

  late Timer timer;
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

}