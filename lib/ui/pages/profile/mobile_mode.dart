part of 'profile_page.dart';

class _MobileMode extends StatefulWidget {
  const _MobileMode({Key? key}) : super(key: key);

  @override
  State<_MobileMode> createState() => _MobileModeState();
}

class _MobileModeState extends State<_MobileMode>{

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
    HomeProvider homeProvider = Provider.of(context);
    ProfileMobileModeProvider mobileModeProvider = Provider.of(context);
    GlobalSettingProvider settingProvider = Provider.of(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
      child: Column(
        children: [
          PhloxAnime(
            phloxAnimationsController: mobileModeProvider.profileAnimationText,
            millisecondsDelay: 700,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 160,
                  width: 120,
                  child: InkWell(
                    onTap: () async{
                      Uint8List? bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
                      if(bytesFromPicker == null){
                        return;
                      }
                      mobileModeProvider.requestProfileImage(context,bytesFromPicker);
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
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              height: 110,
                              width: double.infinity,
                              color: settingProvider.darkMode
                                  ? Colors.blueGrey[100]
                                  : Colors.white,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            Links.profileUrl + (homeProvider.modelPersonalData?.profile_url ?? ''),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExtraBoldText(text: homeProvider.modelPersonalData?.display_name ?? 'خالی', textSize: 44 , maxLine: 1,),
                      Text(
                        homeProvider.modelPersonalData?.work ?? 'خالی',
                        style: const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          PhloxAnime(
            phloxAnimationsController: mobileModeProvider.profileAnimationExpanded,
            millisecondsDelay: 900,
            child: Text(
              homeProvider.modelPersonalData?.bio ?? 'خالی',
            ),
          ),
        ],
      ),
    );
  }
}
