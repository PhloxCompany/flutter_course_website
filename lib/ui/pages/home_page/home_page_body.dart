part of 'home_page.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<HomeProvider>().requestHeadline());
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of(context);
    GlobalSettingProvider settingProvider = Provider.of(context);

    var numFormat = intl.NumberFormat("0,000");
    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1024;
    bool _isPhone = width <= 512;

    return Padding(
      padding: EdgeInsets.all(_isWeb
          ? 32
          : _isPhone
              ? 12
              : 16),
      child: Container(
        width: _isWeb ? 1024 : double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: _isWeb
                ? 48
                : _isPhone
                    ? 18
                    : 32,
            vertical: _isPhone ? 12 : 32),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
                color: settingProvider.darkMode ? Colors.black : Colors.white,
                width: 1),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                color: Colors.grey.shade900.withOpacity(.7),
                blurRadius: 60,
              ),
            ],
            color: settingProvider.darkMode ? Colors.blueGrey.shade900 : Colors.amber.shade50,
            image: settingProvider.darkMode
                ? null
                : const DecorationImage(
                    image: NetworkImage(
                      '${Links.filesUrl}/bg.jpg',
                    ),
                    fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app bar
            const CustomAppBar(),

            // babak image
            if (!_isWeb) _babak,

            // floating header right side
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PhloxAnime(
                        child: Text("_____ ???????? ????????????"),
                        millisecondsDelay: 600,
                      ),
                      PhloxAnime(
                        millisecondsDelay: 900,
                        child: ExtraBoldText(
                          text: "?????????? ?????????? ????",
                          textSize: _isWeb
                              ? 82
                              : _isPhone
                                  ? 28
                                  : 32,
                        ),
                      ),
                      const PhloxAnime(
                        child: BoldText(
                            text: '???? ?????????????? ???????? ?????????? ???? ?????? ????????????'),
                        millisecondsDelay: 1100,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const PhloxAnime(
                        child: Text("???? ?????????? ???????? ???????????? ????????"),
                        millisecondsDelay: 1300,
                      ),
                      const SizedBox(
                        height: 46,
                      ),
                      Wrap(
                        children: [
                          if (homeProvider.loading == false)
                            if ((homeProvider.modelPersonalData?.purchased ??
                                    false) ==
                                false)
                              PhloxAnime(
                                  child: ButtonBlack(
                                    onPressed: () =>
                                        settingProvider.scrollToPrice(context),
                                    text: "?????? ?????? ???? ????????",
                                    padding: EdgeInsets.symmetric(
                                        horizontal: _isWeb
                                            ? 42
                                            : _isPhone
                                                ? 18
                                                : 24,
                                        vertical: _isPhone ? 18 : 20),
                                  ),
                                  millisecondsDelay: 1500),
                          if (homeProvider.loading == false)
                            if ((homeProvider.modelPersonalData?.purchased ??
                                    false) ==
                                false)
                              const SizedBox(
                                width: 12,
                              ),
                          PhloxAnime(
                              millisecondsDelay: 1600,
                              child: BorderButtonWidget(
                                onPressed: () =>
                                    settingProvider.scrollToHeadline(_isWeb),
                                text: "?????????? ?????? ????????",
                                padding: EdgeInsets.symmetric(
                                    horizontal: _isWeb
                                        ? 42
                                        : _isPhone
                                            ? 18
                                            : 24,
                                    vertical: _isPhone ? 18 : 20),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                if (_isWeb) Expanded(child: _babak),
              ],
            ),

            const SizedBox(
              height: 46,
            ),

            const PhloxAnime(
              millisecondsDelay: 1800,
              child: ExtraBoldText(
                text: '. ?????????? ?????????? ??????????',
                textSize: 32,
              ),
            ),
            const PhloxAnime(
              millisecondsDelay: 1900,
              child: Text(
                  "?????????? ???? ???????? ???? ?????? ?????????? ?????? ???? ?????? ???? ????????????????????? ????????????????????? ???????? ??????????????? ????????????????????????? ?????? ?????????????? ???????????? ??????. ???????? ??????????????????????????? ?????????????? ?? iOS ???????????? ???? ?????? ???????? ?????????? ???? ?????? ?????????????? ???? ???????????? ???? ??????????????????????? ?????? ?????????????? ???????? ?????????? React Native ?? NativeScript ??????????????? ???????? ?? ?????????????? ??????????????????? ???????? ??????????????? ?????? ?????????? ?????????????."),
            ),
            const SizedBox(
              height: 46,
            ),
            const PhloxAnime(
              millisecondsDelay: 2000,
              child: ExtraBoldText(
                text: '. ?????????? ?????? ???????? ?????????? ??????????',
                textSize: 32,
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    const PhloxAnime(
                      millisecondsDelay: 2100,
                      child: TextLiWidget(
                          text: "???????????? ???? ?????????? ???????? ?????? ?????????????? ?? iOS"),
                    ),
                    const PhloxAnime(
                      millisecondsDelay: 2200,
                      child: TextLiWidget(
                          text: "???????????? ???????? ???? ?????????? ???????? ???????????? ???? ??????????"),
                    ),
                    const PhloxAnime(
                        millisecondsDelay: 2300,
                        child: TextLiWidget(
                            text: "?????????? ???????? ?????????????? Sqlite  ???? ??????????")),
                    const PhloxAnime(
                      millisecondsDelay: 2400,
                      child: TextLiWidget(
                          text: "?????????? ????????  ???????? ?????? ?????????????????? ???????????? ??????????"),
                    ),
                    const PhloxAnime(
                        millisecondsDelay: 2500,
                        child: TextLiWidget(text: "?????????? ???????? ???????????? ???? ????????")),
                    Visibility(
                      visible: !_isWeb,
                      child: _listLi2,
                    ),
                  ],
                )),
                Visibility(
                  visible: _isWeb,
                  child: Expanded(child: _listLi2),
                ),
              ],
            ),
            const SizedBox(
              height: 46,
            ),
            const PhloxAnime(
              millisecondsDelay: 2590,
              child: ExtraBoldText(
                text: '. ?????????? ?????? ????????',
                textSize: 32,
              ),
            ),

            homeProvider.loading
                ? const CircularProgressIndicator()
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ItemHeadline(
                        modelHeadline: homeProvider.listHeadlines[index]),
                    itemCount: homeProvider.listHeadlines.length,
                  ),

            const SizedBox(
              height: 10,
            ),

            const ExtraBoldText(
              text: "???????? ???? ?????? ??????",
              textSize: 24,
              color: Colors.green,
            ),

            const SizedBox(
              height: 32,
            ),

            const Text(
              "?????????? ???????? : 09393363664",
              style: TextStyle(fontFamily: "vazir"),
            ),

            const SizedBox(
              height: 10,
            ),

            if (homeProvider.modelConfigs != null)
              if ((homeProvider.modelPersonalData?.purchased ?? false) == false)
                Wrap(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 32,
                      color: settingProvider.darkMode
                          ? AppColors.blueBgDark
                          : Colors.amber.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(
                            color: settingProvider.darkMode
                                ? Colors.blueGrey.shade900
                                : Colors.white,
                            width: 2),
                      ),
                      child: SizedBox(
                        width: width > 600 ? 280 : double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const ExtraBoldText(
                                text: '???????? ?????? ???? ???? ??????????',
                                textSize: 32,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      const Icon(Icons.visibility_rounded),
                                      Text(
                                        homeProvider.modelConfigs?.home ?? "0",
                                        style: const TextStyle(
                                            fontFamily: 'vazir',
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Icon(Icons.account_circle_rounded),
                                      Text(
                                        homeProvider.modelConfigs?.buyCount ??
                                            "0",
                                        style: const TextStyle(
                                            fontFamily: 'vazir',
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    numFormat.format(double.parse(homeProvider
                                        .modelConfigs!.coursePrice!)),
                                    style: const TextStyle(
                                        textBaseline: TextBaseline.alphabetic,
                                        fontFamily: 'vazir',
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: 30),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    '????????',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              MaterialButton(
                                color: Colors.black,
                                minWidth: double.infinity,
                                onPressed: () {
                                  settingProvider.token == null
                                      ? Navigator.pushNamed(
                                          context, LoginWithPhoneUi.routeName)
                                      : homeProvider.startPay();
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      Utils.amountSlice(homeProvider
                                          .modelConfigs!
                                          .coursePriceWithDiscount!),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'vazir',
                                      ),
                                    ),
                                    const Text(
                                      " ???????? ??????????",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'vazir',
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                elevation: 32,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 42,
                                    vertical: _isPhone ? 12 : 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (width > 600)
                      const SizedBox(
                        width: 30,
                      ),
                    if (width > 600)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExtraBoldText(
                            text: "?????????? ?????????? ????",
                            textSize: _isWeb
                                ? 82
                                : _isPhone
                                    ? 28
                                    : 32,
                          ),
                          const BoldText(
                              text: '???? ?????????????? ???????? ?????????? ???? ?????? ????????????'),
                        ],
                      ),
                  ],
                )
          ],
        ),
      ),
    );
  }
}
