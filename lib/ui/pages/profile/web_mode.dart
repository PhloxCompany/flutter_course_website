part of 'profile_page.dart';

class _WebMode extends StatefulWidget {
  const _WebMode({Key? key}) : super(key: key);

  @override
  State<_WebMode> createState() => _WebModeState();
}

class _WebModeState extends State<_WebMode> {

  @override
  Widget build(BuildContext context) {

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
                  width: 360,
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
                          'assets/images/elon_musk.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
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
                const ExtraBoldText(
                    text: "بابک قهرمانزاده جوشن", textSize: 80 ),
                const Text(
                  "دیزاین کار / وبسایت نویس",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    "صفی‌الدین در ۶۵۰ هجری قمری در کلخوران پا به دنیا گذاشت. پدر و نیاکانش او در قریه کلخوران اردبیل زراعت داشتند و پیشینیان شان از قریه رنگین گیلان به اسفرنجان در حدود اردبیل آمده بودند. پدر او امین‌الدین جبرئیل نام داشت و می‌گویند با وجود مکنتی که از راه کشاورزی به هم رسانیده بود، علاقه به عزلت و گوشه‌نشینی داشت و از معاشرت با خلق می‌پرهیخت. صفی‌الدین در عین اشتغال به مقدمات علوم رسمی، تمایلی به پارسایی و ریاضت یافت و به روزه‌داری و شب‌زنده‌داری روی آورد. گاه اوقاتش را در مقابر اولیا به سر می‌برد و گاه رؤیاها و مکاشفات صوفیانه می‌دید و گاه به کوه سبلان برای آنچه آن را «ملاقات مردان خدا» می‌خواند، می‌رفت و در آن حال، از آب و خاک آن کوه چیزی به تبرک همراه می‌آورد. این که از علوم رسمی چه اندازه بهره داشت، معلوم نیست، اما از اقوال و احوالش، آشنایی کافی با علوم شرعی پیدا است. به هر حال چنان که از قول مؤلف عالم‌آرای عباسی برمی‌آید، «مدتی به اکتساب فضایل و کمالات صوری پرداخت» و این کمالات او لامحاله، آن اندازه بود که قرآن را ازبرکرد، در فرایض و سنن وقوف تمام یافت، چنان که از لغات عربی و پارسی و ترکی و مغولی هم بهره‌مند گشت و به قول مؤلف روضات الجنان از اشعار و نکات و لطایف نیز محتظی شد.",
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
