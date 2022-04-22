import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/profile_mobile_mode_provider.dart';
import 'package:flutter_course_phlox/ui/widgets/animate/phlox_anime.dart';
import 'package:flutter_course_phlox/ui/widgets/text/extra_bold_text.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:provider/provider.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
        phloxAnimationsController: profileMobileModeProvider.profileAnimationText,
        millisecondsDelay: 700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExtraBoldText(text: 'ارتباط با ما',textSize: _isWeb? 120 : 60,),
            Text(
              'برای ارتباط با ما لطفا نام، ایمیل و\nپیام خودتونو وارد نمایید',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: _isWeb ? 18 : 16, color: Colors.grey),
            ),
            const SizedBox(height: 10,),
            PhloxAnime(
              phloxAnimationsController: profileMobileModeProvider.profileAnimationExpanded,
              millisecondsDelay: 900,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('نام', style: TextStyle(fontSize: 14),),
                  ),
                  SizedBox(
                    width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                        )
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('ایمیل', style: TextStyle(fontSize: 14),),
                  ),
                  SizedBox(
                    width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                        )
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('پیام', style: TextStyle(fontSize: 14),),
                  ),
                  SizedBox(
                    width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  MaterialButton(
                    minWidth: 120,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    elevation: 0,
                    height: 54,
                    color: const Color(0xff2d3653),
                    child: const Text('ثبت' , style: TextStyle(color: Colors.white),),
                    onPressed: () {

                  },),
                  const SizedBox(height: 40,),
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}
