import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  Utils._();
  static void showToast(value , {Color backgroundColor = Colors.black , Color textColor = Colors.white}){
    Fluttertoast.showToast(
        msg: value,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: backgroundColor,
        textColor: textColor,
        webBgColor: "linear-gradient(to right, #000000, #000000)",
        fontSize: 16.0
    );
  }

}