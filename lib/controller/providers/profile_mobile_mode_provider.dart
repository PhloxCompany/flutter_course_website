import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/global_setting_provider.dart';
import 'package:flutter_course_phlox/ui/pages/profile/profile_items/exit_account.dart';
import 'package:flutter_course_phlox/ui/pages/profile/profile_page.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';

class ProfileMobileModeProvider extends ChangeNotifier {

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
