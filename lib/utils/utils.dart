import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/global_setting_provider.dart';
import 'package:flutter_course_phlox/utils/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Utils {
  Utils._();

  static void showToast(value,
      {Color backgroundColor = Colors.black, Color textColor = Colors.white}) {
    Fluttertoast.showToast(
        msg: value,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: backgroundColor,
        textColor: textColor,
        webBgColor: "linear-gradient(to right, #000000, #000000)",
        fontSize: 16.0);
  }

  static Future showDialogYesNo(BuildContext context,
      {required String yesText,
      required String noText,
      required VoidCallback yesOnTap,
      VoidCallback? noOnTap}) async {
    return await showDialog(
        context: context,
        builder: (c) => Dialog(
              elevation: 32,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              backgroundColor: context.read<GlobalSettingProvider>().darkMode
                  ? AppColors.blueBgDark
                  : Colors.yellow.shade50,
            ));
  }

  static String amountSlice(String amount){
    amount = amount.substring(0, amount.length - (3 + 1)); // rials
    return amount;
  }



}
