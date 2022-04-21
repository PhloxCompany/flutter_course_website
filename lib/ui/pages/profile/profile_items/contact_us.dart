import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/profile_mobile_mode_provider.dart';
import 'package:flutter_course_phlox/ui/widgets/animate/phlox_anime.dart';
import 'package:provider/provider.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    ProfileMobileModeProvider profileMobileModeProvider = Provider.of(context);
    return Row(
      children: [
        PhloxAnime(
          phloxAnimationsController: profileMobileModeProvider.profileAnimationText,
          millisecondsDelay: 700,
          child: Column(
            children: [
              Text('hi')

            ],
          ),
        ),
        PhloxAnime(
          phloxAnimationsController: profileMobileModeProvider.profileAnimationExpanded,
          millisecondsDelay: 900,
          child: Column(
            children: [
              Text('hi')
            ],
          ),
        ),
      ],
    );
  }
}
