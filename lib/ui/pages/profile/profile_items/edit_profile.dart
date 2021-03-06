import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/home_provider.dart';
import 'package:flutter_course_phlox/ui/widgets/animate/phlox_anime.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:provider/provider.dart';

import '../../../../controller/providers/profile_mobile_mode_provider.dart';
import '../../../widgets/text/extra_bold_text.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<ProfileMobileModeProvider>().profileAnimationText =
        PhloxAnimationsController();
    context.read<ProfileMobileModeProvider>().profileAnimationExpanded =
        PhloxAnimationsController();
    Future.microtask(() {

      ProfileMobileModeProvider profileMobileModeProvider = Provider.of(context , listen: false);
      HomeProvider homeProvider = Provider.of(context , listen: false);

      profileMobileModeProvider.displayNameController.text = homeProvider.modelPersonalData?.display_name?? '';
      profileMobileModeProvider.ageController.text = homeProvider.modelPersonalData?.age.toString() ??'';
      profileMobileModeProvider.howFindUs.text = homeProvider.modelPersonalData?.how_find_us?? '';
      profileMobileModeProvider.workController.text = homeProvider.modelPersonalData?.work??'';
      profileMobileModeProvider.bioController.text = homeProvider.modelPersonalData?.bio?? '';
    });
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1024;
    if (_isWeb) {
      context.read<ProfileMobileModeProvider>().profileAnimationText =
          PhloxAnimationsController();
      context.read<ProfileMobileModeProvider>().profileAnimationExpanded =
          PhloxAnimationsController();
    }
    ProfileMobileModeProvider profileMobileModeProvider = Provider.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ExtraBoldText(
          text: '?????????? ??????????????',
          textSize: _isWeb ? 120 : 60,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: !_isWeb ? 4 : 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: PhloxAnime(
                  phloxAnimationsController:
                      profileMobileModeProvider.profileAnimationText,
                  millisecondsDelay: 700,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: profileMobileModeProvider.displayNameController,
                        decoration: InputDecoration(
                            hintText: '??????',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: profileMobileModeProvider.bioController,
                        decoration: InputDecoration(
                            hintText: '?????????????? ???????????? ??????',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: profileMobileModeProvider.howFindUs,
                        decoration: InputDecoration(
                            hintText: '???????? ???????????? ???? ????',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (!_isWeb)
                        Column(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: profileMobileModeProvider.ageController,
                                  decoration: InputDecoration(
                                      hintText: '????',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32))),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: profileMobileModeProvider.workController,
                                  decoration: InputDecoration(
                                      hintText: '???????? ??????',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32))),
                                ),
                              ],
                            ),
                          ],
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        elevation: 0,
                        minWidth: 200,
                        height: 60,
                        color: const Color(0xff2d3653),
                        onPressed: () {
                          profileMobileModeProvider.requestEditProfile(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        child: const Text(
                          '?????? ??????????????',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: !_isWeb ? 0 : 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: _isWeb ? 20 : 0),
                child: PhloxAnime(
                    phloxAnimationsController:
                        profileMobileModeProvider.profileAnimationExpanded,
                    millisecondsDelay: 900,
                    child: _isWeb
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: profileMobileModeProvider.ageController,

                                decoration: InputDecoration(
                                    hintText: '????',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32))),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: profileMobileModeProvider.workController,
                                decoration: InputDecoration(
                                    hintText: '???????? ??????',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32))),
                              ),
                            ],
                          )
                        : const SizedBox()),
              ),
            )
          ],
        ),
      ],
    );
  }
}
