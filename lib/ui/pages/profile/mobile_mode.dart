part of 'profile_page.dart';

class _MobileMode extends StatefulWidget {
  const _MobileMode({Key? key}) : super(key: key);

  @override
  State<_MobileMode> createState() => _MobileModeState();
}

class _MobileModeState extends State<_MobileMode> {

  @override
  Widget build(BuildContext context) {
    ProfileMobileModeProvider mobileModeProvider = Provider.of(context);
    GlobalSettingProvider settingProvider = Provider.of(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              AnimatedRotation(
                turns: mobileModeProvider.turns,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOutExpo,
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      mobileModeProvider.checkClickMode();
                      mobileModeProvider.controller.toggle();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: mobileModeProvider.animationController!,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const BoldText(
                text: "شرکت برنامه نویسی فلوکس",
              ),
              const Expanded(child: SizedBox()),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: InkWell(
                  onTap: () {
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 160,
                width: 120,
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
                        'assets/images/elon_musk.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ExtraBoldText(text: "بابک قهرمانزاده جوشن", textSize: 44),
                  Text(
                    "دیزاین کار / وبسایت نویس",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "صفی‌الدین در ۶۵۰ هجری قمری در کلخوران پا به دنیا گذاشت. پدر و نیاکانش او در قریه کلخوران اردبیل زراعت داشتند و پیشینیان شان از قریه رنگین گیلان به اسفرنجان در حدود اردبیل آمده بودند. پدر او امین‌الدین جبرئیل نام داشت و می‌گویند با وجود مکنتی که از راه کشاورزی به هم رسانیده بود، علاقه به عزلت و گوشه‌نشینی داشت و از معاشرت با خلق می‌پرهیخت. صفی‌الدین در عین اشتغال به مقدمات علوم رسمی، تمایلی به پارسایی و ریاضت یافت و به روزه‌داری و شب‌زنده‌داری روی آورد. گاه اوقاتش را در مقابر اولیا به سر می‌برد و گاه رؤیاها و مکاشفات صوفیانه می‌دید و گاه به کوه سبلان برای آنچه آن را «ملاقات مردان خدا» می‌خواند، می‌رفت و در آن حال، از آب و خاک آن کوه چیزی به تبرک همراه می‌آورد. این که از علوم رسمی چه اندازه بهره داشت، معلوم نیست، اما از اقوال و احوالش، آشنایی کافی با علوم شرعی پیدا است. به هر حال چنان که از قول مؤلف عالم‌آرای عباسی برمی‌آید، «مدتی به اکتساب فضایل و کمالات صوری پرداخت» و این کمالات او لامحاله، آن اندازه بود که قرآن را ازبرکرد، در فرایض و سنن وقوف تمام یافت، چنان که از لغات عربی و پارسی و ترکی و مغولی هم بهره‌مند گشت و به قول مؤلف روضات الجنان از اشعار و نکات و لطایف نیز محتظی شد.",

          ),
        ],
      ),
    );
  }
}
