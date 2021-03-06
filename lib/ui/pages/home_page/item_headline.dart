import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/global_setting_provider.dart';
import 'package:flutter_course_phlox/controller/providers/home_provider.dart';
import 'package:flutter_course_phlox/model/model_headline.dart';
import 'package:flutter_course_phlox/ui/pages/login/login_with_phone.dart';
import 'package:flutter_course_phlox/ui/widgets/button/border_button_widget.dart';
import 'package:flutter_course_phlox/ui/widgets/text/extra_bold_text.dart';
import 'package:flutter_course_phlox/utils/colors.dart';
import 'package:flutter_course_phlox/utils/links.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemHeadline extends StatelessWidget {
  final ModelHeadline modelHeadline;

  const ItemHeadline({Key? key, required this.modelHeadline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalSettingProvider settingProvider = Provider.of(context, listen: true);

    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1024;
    bool _isPhone = width <= 400;

    return Directionality(textDirection: TextDirection.rtl, child: modelHeadline.headlineType == "title"
        ? _itemTitle(context)
        : _itemHeadLine(context,
        body: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 32,
              color: settingProvider.darkMode
                  ? AppColors.blueBg
                  : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(
                    color: settingProvider.darkMode
                        ? Colors.black
                        : Colors.white,
                    width: 1),
              ),
              margin: EdgeInsets.all(_isWeb
                  ? 24
                  : _isPhone
                  ? 4
                  : 18),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: _video(modelHeadline, context),
              ),
            ),
            // if (modelHeadline.chewieController != null)
            //   IconButton(
            //       onPressed: () {
            //         modelHeadline.chewieController!.toggleFullScreen();
            //       },
            //       icon: Icon(modelHeadline.chewieController!.isFullScreen
            //           ? Icons.fullscreen
            //           : Icons.fullscreen_exit)),
            if (modelHeadline.des != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('''${modelHeadline.des}'''),
              ),


            /// download video
            if (modelHeadline.chewieController != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Expanded(
                        child: Text(
                          "?????? ???? ?????????? ?????????? ???????? ???????????? ???? ???????????? ???????????? ????????",
                          style: TextStyle(color: Colors.grey,
                              fontSize: 10),
                        )),
                    MaterialButton(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 32,
                      color: settingProvider.darkMode
                          ? AppColors.blueBg
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(
                            color: settingProvider.darkMode
                                ? Colors.black
                                : Colors.white,
                            width: 1),
                      ),
                      onPressed: () async {
                        String url = Links.courseUrl + modelHeadline.id.toString() + ".mp4";
                        if(modelHeadline.videoVisibility != VideoVisibility.global){
                          url += "&token=" + (settingProvider.token ?? "");
                        }
                        if(await canLaunch(url)){
                          await launch(url);
                        }else {
                          throw 'Could not launch $url';
                        }                      },
                      child: const Text("????????????",
                        style: TextStyle(
                            fontSize: 10),),
                    )
                  ],
                ),
              ),

            if (modelHeadline.des != null)
              const SizedBox(
                height: 12,
              ),
          ],
        )));
  }

  Widget _itemHeadLine(context, {required Widget body}) {
    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1024;
    GlobalSettingProvider settingProvider = Provider.of(context, listen: true);
    return Container(
      width: _isWeb ? 1060 : double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(
              color: settingProvider.darkMode ? AppColors.blueBg : Colors.white,
              width: 2),
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
      child: ExpansionTile(
        title: Container(
            padding:
                EdgeInsets.only(right: _isWeb ? 6 : 2, top: 12, bottom: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "${modelHeadline.index}",
                          style: const TextStyle(
                              fontSize: 12, fontFamily: 'vazir'),
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      elevation: 32,
                      color: settingProvider.darkMode
                          ? AppColors.blueBg
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                            color: settingProvider.darkMode
                                ? Colors.black
                                : Colors.white,
                            width: 1),
                      ),
                    ),
                    Expanded(child: Text(modelHeadline.title)),
                    if (width > 400) _row1()
                  ],
                ),
                if (width <= 400) _row1()
              ],
            )),
        children: [body],
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
                  ? "????????????"
                  : "??????????",
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
          if (modelHeadline.complete)
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
            ? ((context.read<HomeProvider>().modelPersonalData?.purchased ??
                        false) ==
                    false)
                ? showGoToPurchase(context)
                : (modelHeadline.complete == false)
                    ? waitToComplete(context)
                    : (modelHeadline.chewieController != null &&
                            modelHeadline.videoController.value.isInitialized)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Chewie(
                              controller: modelHeadline.chewieController!,
                            ),
                          )
                        : _loading()
            : showGoToSignIn(context);
      case VideoVisibility.public:
        return (settingProvider.token != null)
            ? (modelHeadline.complete == false)
                ? waitToComplete(context)
                : (modelHeadline.chewieController != null &&
                        modelHeadline.videoController.value.isInitialized)
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Chewie(
                          controller: modelHeadline.chewieController!,
                        ),
                      )
                    : _loading()
            : showGoToSignIn(context);
      case VideoVisibility.global:
        return (modelHeadline.complete == false)
            ? waitToComplete(context)
            : modelHeadline.chewieController != null &&
                    modelHeadline.videoController.value.isInitialized
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(24),
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

  Widget showGoToSignIn(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool _isPhone = width <= 600;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ExtraBoldText(
          text: "???????? ?????????????? ???????? ????????",
          textSize: _isPhone ? 24 : 32,
        ),
        const Text("???????? ???????? ?????? ?????????? ???????? ???????? ?????????? ?????? ????????"),
        BorderButtonWidget(
            onPressed: () {
              Navigator.pushNamed(context, LoginWithPhoneUi.routeName);
            },
            text: "????????",
            padding: EdgeInsets.symmetric(
                horizontal: _isPhone ? 24 : 42, vertical: _isPhone ? 14 : 20))
      ],
    );
  }

  Widget showGoToPurchase(BuildContext context) {
    GlobalSettingProvider settingProvider = Provider.of(context, listen: true);

    double width = MediaQuery.of(context).size.width;
    bool _isPhone = width <= 600;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ExtraBoldText(
          text: "???????? ???????? ???????? ??????????",
          textSize: _isPhone ? 24 : 32,
        ),
        const Text("???????? ???????? ?????? ?????????? ???????? ???????? ???? ?????????????? ????????"),
        BorderButtonWidget(
            onPressed: () => settingProvider.scrollToPrice(context),
            text: "????????????",
            padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20))
      ],
    );
  }

  Widget waitToComplete(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool _isPhone = width <= 600;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ExtraBoldText(
          text: "???? ?????? ??????",
          textSize: _isPhone ? 24 : 32,
        ),
        const Text("???????? ?????????? ?????????? ?????????? ??????????!"),
      ],
    );
  }

  Widget _itemTitle(context) {
    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1024;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(color: Colors.grey, height: 1),
          ExtraBoldText(
            text: modelHeadline.title,
            textSize: _isWeb ? 32 : 24,
          ),
          if (modelHeadline.des != null) Text(modelHeadline.des!)
        ],
      ),
    );
  }
}
