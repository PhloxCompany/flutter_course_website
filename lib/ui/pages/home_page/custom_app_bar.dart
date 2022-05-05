part of "home_page.dart";

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalSettingProvider settingProvider = Provider.of(context, listen: false);
    HomeProvider homeProvider = Provider.of(context, listen: true);
    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1024;
    bool _isPhone = width <= 600;
    return Column(
      children: [
        Row(
          children: [
            PhloxAnime(
                millisecondsDelay: 100,
                child: InkWell(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false),
                  child: BoldText(text: "شرکت برنامه نویسی فلوکس",
                      textSize : _isWeb ? 18 : 12
                  ),
                )),
            const Spacer(),
            IconButton(
                onPressed: () => settingProvider.changeThemeMode(),
                icon: Icon(settingProvider.darkMode
                    ? Icons.light_mode
                    : Icons.dark_mode)),

            const SizedBox(width: 12,),
            homeProvider.loading == false ? PhloxAnime(
              millisecondsDelay: 300,
              child: homeProvider.modelPersonalData == null
                  ? BorderButtonWidget(
                onPressed: () {
                  Navigator.pushNamed(
                      context, LoginWithPhoneUi.routeName);
                },
                text: "ورود",
                padding: EdgeInsets.symmetric(
                    horizontal: _isWeb
                        ? 42
                        : _isPhone
                        ? 18
                        : 24,
                    vertical: _isPhone ? 18 : 20),
              )
                  : MaterialButton(
                onPressed: () => Navigator.pushNamed(
                    context, ProfilePage.routeName),
                minWidth: 0,
                padding: EdgeInsets.zero,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 32,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                        color: Colors.white, width: 1)),
                color: settingProvider.darkMode
                    ? Colors.grey[900]
                    : Colors.grey[100],
                child: SizedBox(
                  width: 46,
                  height: 46,
                  child:
                  homeProvider.modelPersonalData!.profile_url ==
                      null
                      ? const Icon(Icons.person)
                      : Image.network(Links.profileUrl +
                      homeProvider
                          .modelPersonalData!.profile_url!),
                ),
              ),
            ) : const SizedBox(
              width: 46,
              height: 46,)
          ],
        ),
        const SizedBox(
          height: 38,
        ),
      ],
    );
  }
}
