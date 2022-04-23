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
    Future.microtask(
        () => context.read<HomeProvider>().requestHeadline());
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of(context);
    GlobalSettingProvider settingProvider = Provider.of(context);

    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1024;

    return Padding(
      padding: EdgeInsets.all(_isWeb ? 32 : 16),
      child: Container(
        width: _isWeb ? 1024 : double.infinity,
        padding:
            EdgeInsets.symmetric(horizontal: _isWeb ? 68 : 32, vertical: 32),
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
            color: settingProvider.darkMode ? Colors.blueGrey.shade900 : null,
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
            CustomAppBar(
              actions: [
                const Spacer(),
                IconButton(
                    onPressed: () => settingProvider.changeThemeMode(),
                    icon: Icon(settingProvider.darkMode
                        ? Icons.light_mode
                        : Icons.dark_mode)),
                PhloxAnime(
                  millisecondsDelay: 300,
                  child: BorderButtonWidget(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, LoginWithPhoneUi.routeName);
                      },
                      text: "ورود",
                      padding: EdgeInsets.symmetric(
                          horizontal: _isWeb ? 42 : 24, vertical: 20)),
                ),
              ],
            ),

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
                      child: Text("_____ دوره آنلاین"),
                      millisecondsDelay: 600,
                    ),
                    PhloxAnime(
                      millisecondsDelay: 900,
                      child: ExtraBoldText(
                        text: "متخصص فلاتر شو",
                        textSize: _isWeb ? 82 : 32,
                      ),
                    ),
                    const PhloxAnime(
                      child:
                          BoldText(text: 'یک فریمورک برای توسعه در چند پلتفرم'),
                      millisecondsDelay: 1100,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const PhloxAnime(
                      child: Text("با تدریس بابک قهرمان زاده"),
                      millisecondsDelay: 1300,
                    ),
                    const SizedBox(
                      height: 46,
                    ),
                    Wrap(
                      children: [
                        PhloxAnime(
                            child: ButtonBlack(
                                onPressed: () {},
                                text: "ثبت نام در دوره",
                                padding: EdgeInsets.symmetric(
                                    horizontal: _isWeb ? 42 : 24,
                                    vertical: 20)),
                            millisecondsDelay: 1500),
                        const SizedBox(
                          width: 12,
                        ),
                        PhloxAnime(
                          millisecondsDelay: 1600,
                          child: BorderButtonWidget(
                              onPressed: () =>
                                  settingProvider.scrollToHeadline(_isWeb),
                              text: "سرفصل های دوره",
                              padding: EdgeInsets.symmetric(
                                  horizontal: _isWeb ? 42 : 24, vertical: 20)),
                        ),
                      ],
                    )
                  ],
                )),
                if (_isWeb) Expanded(child: _babak),
              ],
            ),

            const SizedBox(
              height: 46,
            ),

            const PhloxAnime(
              millisecondsDelay: 1800,
              child: ExtraBoldText(
                text: '. مقدمه آموزش فلاتر',
                textSize: 32,
              ),
            ),
            const PhloxAnime(
              millisecondsDelay: 1900,
              child: Text(
                  "فلاتر به سرعت در حال تبدیل شدن به یکی از محبوب‌ترین فریمورک‌ها برای توسعه‌ی اپلیکیشن‌های چند پلتفرمی موبایل است. اغلب توسعه‌دهندگان اندروید و iOS امروزه بر این باور هستند که این فریمورک از بسیاری از فریمورک‌های چند پلتفرمی رقیب مانند React Native و NativeScript سریع‌تر بوده و جایگزین مطمئن‌تری برای سال‌های آتی محسوب می‌شود."),
            ),
            const SizedBox(
              height: 46,
            ),
            const PhloxAnime(
              millisecondsDelay: 2000,
              child: ExtraBoldText(
                text: '. اهداف کلی دوره متخصص فلاتر',
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
                          text: "آشنایی با سیستم عامل های اندروید و iOS"),
                    ),
                    const PhloxAnime(
                      millisecondsDelay: 2200,
                      child: TextLiWidget(
                          text: "آشنایی کامل با طراحی ظاهر کاربری در فلاتر"),
                    ),
                    const PhloxAnime(
                        millisecondsDelay: 2300,
                        child: TextLiWidget(
                            text: "پیاده سازی دیتابیس Sqlite  در فلاتر")),
                    const PhloxAnime(
                      millisecondsDelay: 2400,
                      child: TextLiWidget(
                          text: "پیاده سازی  الگو های استاندارد برنامه نویسی"),
                    ),
                    const PhloxAnime(
                        millisecondsDelay: 2500,
                        child: TextLiWidget(text: "پیاده سازی ارتباط با سرور")),
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
                text: '. سرفصل های دوره',
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
              height: 30,
            ),

            const Text(
              "شماره تماس : 09393363664",
              style: TextStyle(fontFamily: "vazir"),
            )
          ],
        ),
      ),
    );
  }
}
