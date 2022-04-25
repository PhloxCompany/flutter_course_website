import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/profile_mobile_mode_provider.dart';
import 'package:flutter_course_phlox/ui/pages/profile/profile_items/contact_us.dart';
import 'package:flutter_course_phlox/ui/pages/profile/profile_items/edit_profile.dart';
import 'package:flutter_course_phlox/ui/pages/profile/profile_items/exit_account.dart';
import 'package:flutter_course_phlox/ui/widgets/animate/phlox_anime.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:provider/provider.dart';
import '../../../controller/providers/global_setting_provider.dart';
import '../../../utils/colors.dart';
import '../../widgets/text/bold_text.dart';
import '../../widgets/text/extra_bold_text.dart';

part 'mobile_mode.dart';

part 'web_mode.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const routeName = '/profile';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileMobileModeProvider>().animationController =
        AnimationController(
            vsync: this, duration: const Duration(milliseconds: 800));
    context.read<ProfileMobileModeProvider>().profileAnimationText =
        PhloxAnimationsController();
    context.read<ProfileMobileModeProvider>().profileAnimationExpanded =
        PhloxAnimationsController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    context.read<ProfileMobileModeProvider>().animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1024;

    GlobalSettingProvider settingProvider = Provider.of(context, listen: false);
    ProfileMobileModeProvider profileMobileModeProvider = Provider.of(context);
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
                child: PhloxAnime(
                  phloxAnimationsController:
                      profileMobileModeProvider.animationBackground,
                  millisecondsDelay: 300,
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 640),
                    width: _isWeb ? 1024 : double.infinity,
                    margin: EdgeInsets.all(
                      _isWeb ? 32 : 16,
                    ),
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
                      constraints:
                          BoxConstraints(minHeight: constraints.minHeight),
                      child: IntrinsicHeight(
                        child: _isWeb? Row(
                          children: [
                              PhloxAnime(
                                phloxAnimationsController:
                                    profileMobileModeProvider
                                        .profileAnimationItemMenu,
                                millisecondsDelay: 500,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: List.generate(
                                    profileMobileModeProvider
                                        .listBottomSheet.length,
                                    (index) => RotatedBox(
                                      quarterTurns: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 60, bottom: 20),
                                        child: InkWell(
                                          onTap: () {
                                            if (index ==
                                                profileMobileModeProvider
                                                    .indexPage) {
                                              return;
                                            }
                                            if (profileMobileModeProvider.profileAnimationExpanded.animationStatus == AnimationStatus.forward) {
                                              return;
                                            }
                                            if (profileMobileModeProvider
                                                    .profileAnimationExpanded
                                                    .animationStatus ==
                                                AnimationStatus.reverse) {
                                              return;
                                            }
                                            profileMobileModeProvider
                                                .animationBackground
                                                .reverse();
                                            profileMobileModeProvider
                                                .profileAnimationItemMenu
                                                .reverse();
                                            profileMobileModeProvider
                                                .profileAnimationText
                                                .reverse();
                                            profileMobileModeProvider
                                                .profileAnimationExpanded
                                                .reverse();
                                            profileMobileModeProvider
                                                .profileAnimationExpanded
                                                .statusListener = (status) {
                                              if (status ==
                                                  AnimationStatus.dismissed) {
                                                print('ok');
                                                profileMobileModeProvider
                                                    .changeIndex(index);
                                                profileMobileModeProvider
                                                    .animationBackground
                                                    .forward();
                                                profileMobileModeProvider
                                                    .profileAnimationItemMenu
                                                    .forward();
                                                profileMobileModeProvider
                                                    .profileAnimationText
                                                    .forward();
                                                profileMobileModeProvider
                                                    .profileAnimationExpanded
                                                    .forward();
                                              }
                                              profileMobileModeProvider
                                                      .profileAnimationText =
                                                  PhloxAnimationsController();
                                              profileMobileModeProvider
                                                      .profileAnimationExpanded =
                                                  PhloxAnimationsController();
                                            };
                                          },
                                          child: Column(
                                            children: [
                                              ExtraBoldText(
                                                  text:
                                                      profileMobileModeProvider
                                                              .listBottomSheet[
                                                          index]['title']),
                                              Container(
                                                width: 30,
                                                height: 1,
                                                color: settingProvider.darkMode
                                                    ? Colors.white
                                                    : Colors.black,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Expanded(
                                child: [
                              const _WebMode(),
                              const ContactUs(),
                              const EditProfile(),
                              const ExitAccount(),
                            ].elementAt(profileMobileModeProvider.indexPage))
                          ],
                        ): Column(
                          children: [
                            Row(
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: InkWell(
                                    onTap: () {
                                      //profileMobileModeProvider.checkClickMode(context);
                                      profileMobileModeProvider.animationController?.forward();
                                      showModalBottomSheet(
                                          context: context,
                                          backgroundColor: Colors.transparent,
                                          builder: (context) {
                                            return itemBottomSheet(context);
                                          }).whenComplete(() {
                                        debugPrint('trd');
                                        //turns -= 1 / 4;
                                        profileMobileModeProvider.animationController?.reverse();
                                      });
                                      // }
                                      debugPrint('trd');
                                      profileMobileModeProvider.isClicked = !profileMobileModeProvider.isClicked;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: AnimatedIcon(
                                        icon: AnimatedIcons.menu_close,
                                        progress: profileMobileModeProvider.animationController!,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                //),
                                const SizedBox(
                                  width: 10,
                                ),
                                const BoldText(
                                  text: "شرکت برنامه نویسی فلوکس",
                                ),
                                const Expanded(child: SizedBox()),
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                                child: [
                                  const _MobileMode(),
                                  const ContactUs(),
                                  const EditProfile(),
                                  const ExitAccount(),
                                ].elementAt(profileMobileModeProvider.indexPage))
                          ],
                        )
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
  Widget itemBottomSheet(BuildContext context) {
    GlobalSettingProvider globalSettingProvider =
    Provider.of(context, listen: false);
    ProfileMobileModeProvider profileMobileModeProvider = Provider.of(context);
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
          itemCount: profileMobileModeProvider.listBottomSheet.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                leading: Icon(
                  profileMobileModeProvider.listBottomSheet[index]['icon'],
                  color: profileMobileModeProvider.listBottomSheet[index]['color'],
                ),
                title: Text(profileMobileModeProvider.listBottomSheet[index]['title'] , style: TextStyle(color: profileMobileModeProvider.listBottomSheet[index]['color']),),
                onTap: () {
                  Navigator.pop(context);

                  if(index == profileMobileModeProvider.indexPage){
                    return;
                  }
                  if(profileMobileModeProvider.profileAnimationExpanded.animationStatus == AnimationStatus.forward){
                    return;
                  }
                  if(profileMobileModeProvider.profileAnimationExpanded.animationStatus == AnimationStatus.reverse){
                    return;
                  }
                  profileMobileModeProvider.animationBackground.reverse();
                  debugPrint('ok');
                  profileMobileModeProvider.profileAnimationText.reverse();
                  profileMobileModeProvider.profileAnimationExpanded.reverse();
                  profileMobileModeProvider.profileAnimationExpanded.statusListener =  (status) {
                    if(status == AnimationStatus.dismissed){
                      profileMobileModeProvider.changeIndex(index);
                      profileMobileModeProvider.animationBackground.forward();
                      profileMobileModeProvider.profileAnimationText.forward();
                      profileMobileModeProvider.profileAnimationExpanded.forward();
                    }
                    profileMobileModeProvider.profileAnimationText = PhloxAnimationsController();
                    profileMobileModeProvider.profileAnimationExpanded = PhloxAnimationsController();
                  };
                },
              ),
            );
          },
        ),
      ),
    );
  }

}
