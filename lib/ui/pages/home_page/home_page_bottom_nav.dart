part of "home_page.dart";

class _HomePageBottomNavigation extends StatelessWidget {
  const _HomePageBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingProvider = context.watch<GlobalSettingProvider>();
    double width = MediaQuery.of(context).size.width;
    var numFormat = intl.NumberFormat("0,000");
    bool _isWeb = width >= 1024;
    HomeProvider homeProvider = Provider.of(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: PhloxAnime(
        millisecondsDelay: 1000,
        child: Card(
          shadowColor: Colors.grey[800],
          margin: const EdgeInsets.all(22),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 32,
          child: Container(
            width: _isWeb ? 1060 : double.infinity,
            height: _isWeb ? 90 : 80,
            padding: EdgeInsets.symmetric(horizontal: _isWeb ? 42 : 12),
            decoration: BoxDecoration(
              color: settingProvider.darkMode
                  ? Colors.blueGrey.shade800
                  : null,
              image: settingProvider.darkMode
                  ? null
                  : const DecorationImage(
                  opacity: .4,
                  image: NetworkImage(
                    '${Links.filesUrl}/bg.jpg',
                  ),
                  fit: BoxFit.fitWidth),
            ),
            child: Row(
              children: [
                if (width > 560) const Text("دوره آنلاین"),
                const SizedBox(
                  width: 12,
                ),
                ExtraBoldText(
                  text: "متخصص فلاتر شو",
                  textSize: _isWeb ? 32 : 22,
                ),
                const Spacer(),
                if(homeProvider.modelConfigs != null)
                  if(homeProvider.modelConfigs!.hasDiscount == "1" && width > 512)
                  const PhloxAnime(
                  millisecondsDelay: 1500,
                  child: Text("تخفیف ویژه", style: TextStyle(
                    color: Colors.red,
                  ),)
                  // Text(
                  //   numFormat.format(double.parse(
                  //       homeProvider.modelConfigs!.coursePrice!)),
                  //   style: TextStyle(
                  //       fontFamily: 'vazir',
                  //       fontSize: _isWeb ? 22 : 14,
                  //       fontWeight: FontWeight.bold,
                  //       decoration: TextDecoration.lineThrough,
                  //       color: Colors.grey[700],
                  //       decorationColor: Colors.red,
                  //       decorationThickness: 3,
                  //       decorationStyle:
                  //       TextDecorationStyle.solid),
                  // ),
                ),
                const SizedBox(
                  width: 16,
                ),
                PhloxAnime(
                  millisecondsDelay: 1800,
                  child: ButtonBlack(
                      onPressed: () => settingProvider.scrollToPrice(context),
                      text: "ثبت نام در دوره",
                      padding: EdgeInsets.symmetric(
                          horizontal: _isWeb ? 42 : 24,
                          vertical: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
