import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/home_provider.dart';
import 'package:flutter_course_phlox/model/model_configs.dart';
import 'package:flutter_course_phlox/ui/widgets/animate/phlox_anime.dart';
import 'package:flutter_course_phlox/ui/widgets/button/border_button_widget.dart';
import 'package:flutter_course_phlox/ui/widgets/button/button_black.dart';
import 'package:flutter_course_phlox/ui/widgets/text/bold_text.dart';
import 'package:flutter_course_phlox/ui/widgets/text/text_li_widget.dart';
import 'package:flutter_course_phlox/utils/colors.dart';
import 'package:flutter_course_phlox/utils/links.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import '../../../controller/providers/global_setting_provider.dart';
import '../login/login_with_phone.dart';
import '../../widgets/text/extra_bold_text.dart';
import 'custom_app_bar.dart';
import 'item_headline.dart';

part 'home_page_body.dart';
part 'home_page_bottom_nav.dart';
part 'home_page_body_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    var settingProvider = context.watch<GlobalSettingProvider>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: settingProvider.darkMode
            ? AppColors.blueBgDark
            : Colors.amber.shade50,
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 90),
              controller: settingProvider.scrollController,
              child: const Center(
                child: HomePageBody(),
              ),
            ),
            const _HomePageBottomNavigation()
          ],
        ),
      ),
    );
  }
}
