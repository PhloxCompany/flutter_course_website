import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/global_setting_provider.dart';
import 'package:phlox_drawer/controller/phlox_drawer_controller.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';

class ProfileMobileModeProvider extends ChangeNotifier {
  List listBottomSheet = [
    {'title': 'پروفایل', 'icon': Icons.person},
    {'title': 'ارتباط با ما', 'icon': Icons.supervised_user_circle_outlined},
    {'title': 'تغییراطلاعات', 'icon': Icons.person_outline_sharp},
    {'title': 'خروج از اکانت', 'icon': Icons.exit_to_app_outlined , 'color' : Colors.red}
  ];

  //double turns = 0;
  PhloxDrawerController controller = PhloxDrawerController();
  bool isClicked = false;
  AnimationController? animationController;

  void checkClickMode(BuildContext context) {
    // if(isClicked){
    //   turns -= 1 / 4;
    //   animationController?.reverse();
    // } else{
    //turns += 1 / 4;
    animationController?.forward();
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return itemBottomSheet(context);
        }).whenComplete(() {
      debugPrint('trd');
      //turns -= 1 / 4;
      animationController?.reverse();
    });
    // }
    debugPrint('trd');
    isClicked = !isClicked;
    notifyListeners();
  }

  Widget itemBottomSheet(BuildContext context) {
    GlobalSettingProvider globalSettingProvider =
        Provider.of(context, listen: false);
    return Card(

      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: globalSettingProvider.darkMode
          ? AppColors.blueBgDark
          : Colors.amber.shade50,
      margin: const EdgeInsets.all(14.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(12),
          itemCount: listBottomSheet.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                leading: Icon(
                  listBottomSheet[index]['icon'],
                  color: listBottomSheet[index]['color'],
                ),
                title: Text(listBottomSheet[index]['title'] , style: TextStyle(color: listBottomSheet[index]['color']),),
                onTap: () {
                  Navigator.pop(context);
                  debugPrint('click');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
