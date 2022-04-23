import 'package:flutter/material.dart';
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
    context.read<ProfileMobileModeProvider>().profileAnimationText = PhloxAnimationsController();
    context.read<ProfileMobileModeProvider>().profileAnimationExpanded = PhloxAnimationsController();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1024;
    if(_isWeb){
      context.read<ProfileMobileModeProvider>().profileAnimationText = PhloxAnimationsController();
      context.read<ProfileMobileModeProvider>().profileAnimationExpanded = PhloxAnimationsController();
    }
    ProfileMobileModeProvider profileMobileModeProvider = Provider.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ExtraBoldText(
          text: 'تغییر اطلاعات',
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
                  phloxAnimationsController: profileMobileModeProvider.profileAnimationText,
                  millisecondsDelay: 700,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'نام',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)
                          )
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'جنسیت',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)
                          )
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'نحوه آشنایی با ما',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)
                          )
                        ),
                      ),
                      const SizedBox(height: 10,),
                      if(!_isWeb) Column(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                    hintText: 'سن',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(32)
                                    )
                                ),
                              ),
                              const SizedBox(height: 10,),
                              TextField(
                                decoration: InputDecoration(
                                    hintText: 'سال تولد',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(32)
                                    )
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      MaterialButton(
                        elevation: 0,
                        minWidth: 200,
                        height: 60,
                        color: const Color(0xff2d3653),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)
                        ),
                        child: const Text('ثبت اطلاعات' ,style: TextStyle(color: Colors.white),),
                      ),
                      const SizedBox(height: 40,),
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
                  phloxAnimationsController: profileMobileModeProvider.profileAnimationExpanded,
                  millisecondsDelay: 900,
                  child: _isWeb ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'سن',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32)
                            )
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'سال تولد',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32)
                            )
                        ),
                      ),
                    ],
                  ) : const SizedBox()
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
