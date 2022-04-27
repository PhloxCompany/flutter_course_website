import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/global_setting_provider.dart';
import 'package:flutter_course_phlox/controller/providers/home_provider.dart';
import 'package:flutter_course_phlox/model/model_headline.dart';
import 'package:flutter_course_phlox/ui/pages/login/login_with_phone.dart';
import 'package:flutter_course_phlox/ui/widgets/button/border_button_widget.dart';
import 'package:flutter_course_phlox/ui/widgets/text/extra_bold_text.dart';
import 'package:flutter_course_phlox/utils/colors.dart';
import 'package:provider/provider.dart';

class ItemHeadline extends StatelessWidget {
  final ModelHeadline modelHeadline;

  const ItemHeadline({Key? key, required this.modelHeadline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalSettingProvider settingProvider = Provider.of(context, listen: true);
    return _itemHeadLine(context,
        body: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 32,
              color: settingProvider.darkMode ? AppColors.blueBg : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(
                    color: settingProvider.darkMode
                        ? Colors.black
                        : Colors.white,
                  width: 2
                ),
              ),
              margin: const EdgeInsets.all(24),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: _video(modelHeadline, context),
              ),
            ),
            if (modelHeadline.des != null) Text('''${modelHeadline.des}'''),
            if (modelHeadline.des != null) const SizedBox(height: 12,),
          ],
        ));
  }

  Widget _itemHeadLine(context, {required Widget body}) {
    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1024;
    HomeProvider homeProvider = Provider.of(context, listen: true);
    GlobalSettingProvider settingProvider = Provider.of(context, listen: true);
    return Container(
      width: _isWeb ? 1060 : double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: settingProvider.darkMode
              ? AppColors.blueBgDark
              : Colors.amber.shade50,
          boxShadow: [
            BoxShadow(
                color: settingProvider.darkMode
                    ? Colors.grey[900]!
                    : Colors.grey[400]!,
                blurRadius: 24,
                spreadRadius: 1)
          ]),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 300),
        children: [
          ExpansionPanel(
            backgroundColor:
                settingProvider.darkMode ? AppColors.blueBgDark : Colors.white,
            headerBuilder: (context, isExpanded) {
              return Container(
                  padding: EdgeInsets.only(
                      right: _isWeb ? 24 : 18, top: 24, bottom: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(modelHeadline.title)),
                          if (width > 400) _row1()
                        ],
                      ),
                      if (width <= 400) _row1()
                    ],
                  ));
            },
            body: body,
            isExpanded: modelHeadline.isExpanded,
            canTapOnHeader: true,
          ),
        ],
        elevation: 0,
        expandedHeaderPadding: const EdgeInsets.only(right: 12),
        expansionCallback: (panelIndex, isExpanded) =>
            homeProvider.toggleListTile(modelHeadline),
      ),
    );
  }

  Widget _row1() => Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              modelHeadline.videoVisibility == VideoVisibility.global ||
                      modelHeadline.videoVisibility == VideoVisibility.public
                  ? "رایگان"
                  : "پرمیم",
              style: TextStyle(
                fontFamily: 'vazir',
                fontSize: 12,
                color: modelHeadline.videoVisibility ==
                            VideoVisibility.global ||
                        modelHeadline.videoVisibility == VideoVisibility.public
                    ? Colors.green
                    : Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            modelHeadline.time,
            style: const TextStyle(
              fontFamily: 'vazir',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  _video(ModelHeadline modelHeadline, BuildContext context) {
    GlobalSettingProvider settingProvider = Provider.of(context, listen: true);

    switch (modelHeadline.videoVisibility) {
      case VideoVisibility.private:
        return (settingProvider.token != null)
            ? (settingProvider.purchased == false)
                ? showGoToPurchase(context)
                : (modelHeadline.chewieController != null &&
                        modelHeadline.videoController.value.isInitialized)
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Chewie(
                          controller: modelHeadline.chewieController!,
                        ),
                      )
                    : _loading()
            : showGoToSignIn(context);
      case VideoVisibility.public:
        return (settingProvider.token != null)
            ? (modelHeadline.chewieController != null &&
                    modelHeadline.videoController.value.isInitialized)
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Chewie(
                      controller: modelHeadline.chewieController!,
                    ),
                  )
                : _loading()
            : showGoToSignIn(context);
      case VideoVisibility.global:
        return modelHeadline.chewieController != null &&
                modelHeadline.videoController.value.isInitialized
            ? ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Chewie(
                  controller: modelHeadline.chewieController!,
                ),
              )
            : _loading();
    }
  }

  Widget _loading() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text('Loading'),
        ],
      );

  Widget showGoToSignIn(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ExtraBoldText(
            text: "برای مشاهده، وارد شوید",
            textSize: 32,
          ),
          const Text("برای دیدن این ویدیو باید وارد اکانت خود شوید"),
          BorderButtonWidget(
              onPressed: () {
                Navigator.pushNamed(context, LoginWithPhoneUi.routeName);
              },
              text: "ورود",
              padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20))
        ],
      );

  Widget showGoToPurchase(BuildContext context) {
    GlobalSettingProvider settingProvider = Provider.of(context, listen: true);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ExtraBoldText(
          text: "جدید ترین دوره فلاتر",
          textSize: 32,
        ),
        const Text("برای دیدن این ویدیو باید دوره را خریداری کنید"),
        BorderButtonWidget(
            onPressed: () => settingProvider.scrollToPrice(context),
            text: "پرداخت",
            padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20))
      ],
    );
  }
}
