part of 'profile_page.dart';

class _WebMode extends StatefulWidget {
  const _WebMode({Key? key}) : super(key: key);

  @override
  State<_WebMode> createState() => _WebModeState();
}

class _WebModeState extends State<_WebMode> {

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of(context);
    GlobalSettingProvider settingProvider = Provider.of(context, listen: false);
    ProfileMobileModeProvider profileMobileModeProvider = Provider.of(context);
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: PhloxAnime(
            phloxAnimationsController: profileMobileModeProvider.profileAnimationText,
            millisecondsDelay: 700,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child:
                      BoldText(text: "شرکت برنامه نویسی فلوکس", textSize: 18),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 400,
                  width: 300,
                  child: InkWell(
                    onTap: () async {
                      var bytesFromPicker = await FilePicker.platform.pickFiles();
                      if(bytesFromPicker == null){
                        return;
                      }
                      profileMobileModeProvider.requestProfileImage(context,bytesFromPicker.files.first.bytes!);
                      },
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Card(
                            elevation: 42,
                            margin: EdgeInsets.zero,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                            child: Container(
                              height: 300,
                              width: double.infinity,
                              color: settingProvider.darkMode
                                  ? Colors.blueGrey[100]
                                  : Colors.white,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: Image.network(
                            Links.profileUrl + (homeProvider.modelPersonalData?.profile_url?? ''),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: PhloxAnime(
            phloxAnimationsController: profileMobileModeProvider.profileAnimationExpanded,
            millisecondsDelay: 900,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 15 * 15,
                  height: 2,
                  color: settingProvider.darkMode ? Colors.white : Colors.black,
                ),
                Flexible(
                  child: ExtraBoldText(
                      text: homeProvider.modelPersonalData?.display_name ?? 'خالی', textSize: 80 ,maxLine: 1),
                ),
                Text(
                  homeProvider.modelPersonalData?.work ?? 'خالی',
                  style: const TextStyle(color: Colors.grey, fontSize: 18),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    homeProvider.modelPersonalData?.bio ?? 'خالی',
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
