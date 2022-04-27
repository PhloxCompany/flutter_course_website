import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:io' as io;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/api_service.dart';
import 'package:flutter_course_phlox/controller/providers/global_setting_provider.dart';
import 'package:flutter_course_phlox/ui/pages/profile/profile_items/exit_account.dart';
import 'package:flutter_course_phlox/ui/pages/profile/profile_page.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:provider/provider.dart';

import '../../ui/pages/home_page/home_page.dart';
import '../../utils/colors.dart';

class ProfileMobileModeProvider extends ChangeNotifier {

  TextEditingController displayNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController howFindUs = TextEditingController();
  //TextEditingController maxController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController workController = TextEditingController();

  requestProfileImage(BuildContext context,Uint8List file)async{

    FormData formData = FormData.fromMap({
      "profile": MultipartFile.fromBytes(file,filename: 'me.png'),
    });
    await ApiService(context).post(url: 'update_profile.php?api=profile_image', res: (response){
      print(response);
      if(response != false){
        Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false);
      }
    },body: {
      "profile": MultipartFile.fromBytes(file,filename: 'me.png'),
    });
  }


  requestEditProfile(BuildContext context)async{
    await ApiService(context).post(url: 'update_profile.php?api=profile_details', res: (response){
      if(response != false){
        Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false);
      }
    },body: {
      "display_name": displayNameController.text,
      "work": workController.text,
      "bio": bioController.text,
      "age": ageController.text,
      "how_find_us": howFindUs.text,
    });
  }


  PhloxAnimationsController animationBackground = PhloxAnimationsController();
  PhloxAnimationsController profileAnimationItemMenu = PhloxAnimationsController();
  PhloxAnimationsController profileAnimationText = PhloxAnimationsController();
  PhloxAnimationsController profileAnimationExpanded = PhloxAnimationsController();

  int indexPage = 0;

  changeIndex(index){
    indexPage = index;
    notifyListeners();
  }

  List listBottomSheet = [
    {'title': 'پروفایل', 'icon': Icons.person},
    {'title': 'ارتباط با ما', 'icon': Icons.supervised_user_circle_outlined},
    {'title': 'تغییراطلاعات', 'icon': Icons.person_outline_sharp},
    {'title': 'خروج از اکانت', 'icon': Icons.exit_to_app_outlined , 'color' : Colors.red}
  ];

  //double turns = 0;
  bool isClicked = false;
  AnimationController? animationController;

  // void checkClickMode(BuildContext context) {
  //   // if(isClicked){
  //   //   turns -= 1 / 4;
  //   //   animationController?.reverse();
  //   // } else{
  //   //turns += 1 / 4;
  //   animationController?.forward();
  //   showModalBottomSheet(
  //       context: context,
  //       backgroundColor: Colors.transparent,
  //       builder: (context) {
  //         return itemBottomSheet(context);
  //       }).whenComplete(() {
  //     debugPrint('trd');
  //     //turns -= 1 / 4;
  //     animationController?.reverse();
  //   });
  //   // }
  //   debugPrint('trd');
  //   isClicked = !isClicked;
  //   notifyListeners();
  // }

}
