import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/profile_mobile_mode_provider.dart';
import 'package:intl/intl.dart' as intl;
import 'package:phlox_animations/phlox_animations.dart';
import 'package:provider/provider.dart';

import '../../../controller/providers/global_setting_provider.dart';
import '../../../utils/colors.dart';
import '../../widgets/text/bold_text.dart';
import '../../widgets/text/extra_bold_text.dart';
import 'package:phlox_drawer/phlox_drawer.dart';

part 'mobile_mode.dart';
part 'web_mode.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const routeName = '/profile';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1024;
    GlobalSettingProvider settingProvider = Provider.of(context, listen: false);
    ProfileMobileModeProvider mobileModeProvider = Provider.of(context);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: settingProvider.darkMode
                ? AppColors.blueBgDark
                : Colors.amber.shade50,
            body: Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                      child: Container(
                        constraints: const BoxConstraints(
                            minHeight: 640
                        ),
                        width: _isWeb ? 1024 : double.infinity,
                        margin: EdgeInsets.all(_isWeb ? 32 : 16,),
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
                        child: ConstrainedBox(
                            constraints: BoxConstraints(minHeight: constraints.minHeight),
                            child: IntrinsicHeight(child: _isWeb ? const _WebMode() :  _MobileMode())),
                      ),
                    );
                },
              ),
            ),),);
  }
}
//AnimatedRotation(
//                 turns: mobileModeProvider.turns,
//                 duration: const Duration(seconds: 1),
//                 curve: Curves.easeOutExpo,
//                 child: Card(
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   child: InkWell(
//                     onTap: () {
//                       mobileModeProvider.checkClickMode();
//                       mobileModeProvider.controller.toggle();
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: AnimatedIcon(
//                         icon: AnimatedIcons.menu_close,
//                         progress: mobileModeProvider.animationController!,
//                         size: 18,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),