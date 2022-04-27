import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/profile_mobile_mode_provider.dart';
import 'package:flutter_course_phlox/ui/widgets/animate/phlox_anime.dart';
import 'package:flutter_course_phlox/ui/widgets/text/extra_bold_text.dart';
import 'package:flutter_course_phlox/utils/utils.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileMobileModeProvider>().profileAnimationText = PhloxAnimationsController();
    context.read<ProfileMobileModeProvider>().profileAnimationExpanded = PhloxAnimationsController();
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();
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
                    child: Text('نام و یا موضوع', style: TextStyle(fontSize: 14),),
                  ),
                  SizedBox(
                    width: 400,
                    child: TextField(
                      controller: nameController,
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
                      controller: messageController,
                      maxLines: 5,
                      minLines: 4,
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
                    onPressed: () async{
                      if(nameController.text.isEmpty){
                        Utils.showToast('لطفا موضوع و یا نام خود را بنویسید');
                        return;
                      }
                      if(messageController.text.isEmpty){
                        Utils.showToast('لطفا پیام خود را بنویسید');
                        return;
                      }
                      final uri =
                            "mailto:codingwithdhrumil@gmail.com?subject=${nameController.text} Email&body=${messageController.text}";
                        if (await canLaunch(uri)) {
                          await launch(uri);
                        } else {
                          throw 'Could not launch $uri';
                        }

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
