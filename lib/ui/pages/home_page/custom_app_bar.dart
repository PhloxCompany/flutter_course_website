import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/ui/pages/home_page/home_page.dart';

import '../../widgets/animate/phlox_anime.dart';
import '../../widgets/text/bold_text.dart';

class CustomAppBar extends StatelessWidget {
  final List<Widget>? actions;
  const CustomAppBar({Key? key, this.actions }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1024;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: PhloxAnime(
                  millisecondsDelay: 100,
                  child: InkWell(
                    onTap: () => Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false),
                    child: BoldText(text: "شرکت برنامه نویسی فلوکس",
                        textSize : _isWeb ? 18 : 12
                    ),
                  )),
            ),
            if(actions != null)
              ...actions!
          ],
        ),
        const SizedBox(
          height: 46,
        ),
      ],
    );
  }
}
