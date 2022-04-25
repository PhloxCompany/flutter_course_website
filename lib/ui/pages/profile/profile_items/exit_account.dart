import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/ui/widgets/text/bold_text.dart';
import 'package:flutter_course_phlox/ui/widgets/text/extra_bold_text.dart';
import 'package:phlox_animations/phlox_animations.dart';
import '../../../../controller/providers/profile_mobile_mode_provider.dart';
import 'package:flutter_course_phlox/ui/widgets/animate/phlox_anime.dart';
import 'package:provider/provider.dart';

class ExitAccount extends StatefulWidget {
  const ExitAccount({Key? key}) : super(key: key);

  @override
  _ExitAccountState createState() => _ExitAccountState();
}

class _ExitAccountState extends State<ExitAccount> {

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
    return Center(
      child: PhloxAnime(
        phloxAnimationsController:
            profileMobileModeProvider.profileAnimationText,
        millisecondsDelay: 700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ExtraBoldText(
              text: 'خروج از حساب',
              textSize: _isWeb ? 120 : 60,
            ),
            Text(
              'آیا مطمئن هستید که می خواهید\nاز حسابتون خارج شید؟',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: _isWeb ? 18 : 16, color: Colors.grey),
            ),
            const SizedBox(height: 20,),

            PhloxAnime(
              phloxAnimationsController:
              profileMobileModeProvider.profileAnimationExpanded,
              millisecondsDelay: 900,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: _isWeb ? 500 : 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffffdfbe),
                    ),
                    height: _isWeb ? 140 : 130,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: double.infinity,
                          width: 4,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Image.asset('assets/images/warning.png' , width: _isWeb ? 30 : 20 ,height: _isWeb ? 30 : 20,),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'اخطار',
                                  style: TextStyle(
                                      color: Colors.red.shade800,
                                      fontFamily: 'sans_bold',
                                      fontSize: _isWeb ? 20 : 18,
                                      fontWeight: FontWeight.w100),
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  'در صورت خروج از حساب مطمئن باشید که شماره ای که با آن ثبت نام کرده اید را به خاطر دارید',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: _isWeb ? 16 : 14, color: Colors.red.shade900
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40,),
                  MaterialButton(
                    minWidth: 200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(33)
                    ),
                    height: 54,
                    color: Colors.red,
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('خروج از حساب',style: TextStyle(color: Colors.white)),
                        SizedBox(width: 4,),
                        Icon(Icons.delete_outline_outlined, color: Colors.white , size: 25,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // PhloxAnime(
            //   phloxAnimationsController:
            //       profileMobileModeProvider.profileAnimationExpanded,
            //   millisecondsDelay: 900,
            //   child: Card(
            //     child: Text('Animation3'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
