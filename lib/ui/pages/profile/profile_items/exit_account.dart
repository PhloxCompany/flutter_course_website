import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/ui/widgets/text/bold_text.dart';
import 'package:flutter_course_phlox/ui/widgets/text/extra_bold_text.dart';
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
  Widget build(BuildContext context) {
    ProfileMobileModeProvider profileMobileModeProvider = Provider.of(context);
    return Center(
      child: PhloxAnime(
        phloxAnimationsController:
            profileMobileModeProvider.profileAnimationText,
        millisecondsDelay: 700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ExtraBoldText(
              text: 'خروج از حساب',
              textSize: 70,
            ),
            const Text(
              'آیا مطمئن هستید که می خواهید\nاز حسابتون خارج شید؟',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20,),

            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffffdfbe),
              ),
              height: 140,
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
                    child: Image.asset('assets/images/warning.png' , width: 30 ,height: 30,),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'اخطار',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontFamily: 'sans_bold',
                                fontSize: 22,
                                fontWeight: FontWeight.w100),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'در صورت خروج از حساب مطمئن باشید که شماره ای که با آن ثبت نام کرده اید را به خاطر دارید',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 18, color: Colors.redAccent),
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
            PhloxAnime(
              phloxAnimationsController:
                  profileMobileModeProvider.profileAnimationExpanded,
              millisecondsDelay: 900,
              child: Card(
                child: Text('Animation3'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
