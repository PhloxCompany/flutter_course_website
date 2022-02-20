import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/home_provider.dart';
import 'package:flutter_course_phlox/model/model_headline.dart';
import 'package:flutter_course_phlox/ui/widgets/animate/phlox_anime.dart';
import 'package:flutter_course_phlox/ui/widgets/button/border_button_widget.dart';
import 'package:flutter_course_phlox/ui/widgets/button/button_black.dart';
import 'package:flutter_course_phlox/ui/widgets/button/icon_button_widget.dart';
import 'package:flutter_course_phlox/ui/widgets/text/bold_text.dart';
import 'package:flutter_course_phlox/ui/widgets/text/extra_bold_text.dart';
import 'package:flutter_course_phlox/ui/widgets/text/text_li_widget.dart';
import 'package:flutter_course_phlox/utils/links.dart';
import 'package:provider/provider.dart';

class HomeWebPage extends StatefulWidget {
  const HomeWebPage({Key? key}) : super(key: key);

  @override
  State<HomeWebPage> createState() => _HomeWebPageState();
}

class _HomeWebPageState extends State<HomeWebPage> {


  @override
  void initState() {
    super.initState();
    _requestHeadline();
  }

  Future _requestHeadline() async {
    HomeProvider homeProvider = Provider.of(context, listen: false);
    await homeProvider.requestHeadline();
  }


  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Container(
        width: 1080,
        padding: const EdgeInsets.symmetric(horizontal: 68, vertical: 32),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: null,
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                offset: const Offset(0, 0),
                color: Colors.grey[800]!,
                blurRadius: 90,
              ),
            ],
            image: const DecorationImage(
                image: NetworkImage(
                  '${Links.filesUrl}/bg.jpg',
                ),
                fit: BoxFit.fitWidth)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PhloxAnime(
                    millisecondsDelay: 100,
                    child: BoldText(text: "شرکت برنامه نویسی فلوکس")),
                PhloxAnime(
                    millisecondsDelay: 300,
                    child:
                        BorderButtonWidget(onPressed: () {}, text: "ثبت نام"))
              ],
            ),
            const SizedBox(
              height: 46,
            ),
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
                    const PhloxAnime(
                      millisecondsDelay: 900,
                      child: ExtraBoldText(
                        text: "متخصص فلاتر شو",
                        textSize: 82,
                        color: Colors.black,
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
                    Row(
                      children: [
                        PhloxAnime(
                            child: ButtonBlack(
                                onPressed: () {}, text: "ثبت نام در دوره"),
                            millisecondsDelay: 1500),
                        const SizedBox(
                          width: 32,
                        ),
                        PhloxAnime(
                          millisecondsDelay: 1600,
                          child: BorderButtonWidget(
                              onPressed: () {}, text: "سرفصل های دوره"),
                        ),
                      ],
                    )
                  ],
                )),
                Expanded(
                    child: Center(
                  child: PhloxAnime(
                    millisecondsDelay: 1720,
                    child: Image.network(
                      '${Links.filesUrl}man.png',
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                )),
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
                  children: const [
                    PhloxAnime(
                      millisecondsDelay: 2100,
                      child: TextLiWidget(
                          text: "آشنایی با سیستم عامل های اندروید و iOS"),
                    ),
                    PhloxAnime(
                      millisecondsDelay: 2200,
                      child: TextLiWidget(
                          text: "آشنایی کامل با طراحی ظاهر کاربری در فلاتر"),
                    ),
                    PhloxAnime(
                        millisecondsDelay: 2300,
                        child: TextLiWidget(
                            text: "پیاده سازی دیتابیس Sqlite  در فلاتر")),
                    PhloxAnime(
                      millisecondsDelay: 2400,
                      child: TextLiWidget(
                          text: "پیاده سازی  الگو های استاندارد برنامه نویسی"),
                    ),
                    PhloxAnime(
                        millisecondsDelay: 2500,
                        child: TextLiWidget(text: "پیاده سازی ارتباط با سرور")),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: const [
                    PhloxAnime(
                      millisecondsDelay: 2050,
                      child: TextLiWidget(
                          text:
                              "پیاده سازی سرویس های Background Service و  Foreground Service"),
                    ),
                    PhloxAnime(
                        millisecondsDelay: 2150,
                        child:
                            TextLiWidget(text: "آشنایی با انیمیشن در فلاتر")),
                    PhloxAnime(
                        millisecondsDelay: 2250,
                        child: TextLiWidget(
                            text: "آشنایی کامل با State Management ها")),
                    PhloxAnime(
                      millisecondsDelay: 2350,
                      child: TextLiWidget(
                          text:
                              "انتشار اپلیکیشن ها در مارکت های ایرانی و جهانی"),
                    ),
                    PhloxAnime(
                        millisecondsDelay: 2450,
                        child: TextLiWidget(
                            text: "پیاده سازی نقشه Open Street Map")),
                  ],
                )),
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
                    shrinkWrap: true,
                    itemBuilder: _itemHeadline,
                    itemCount: homeProvider.listHeadlines.length,
                  ),
          ],
        ),
      ),
    );
  }

  Widget _itemHeadline(BuildContext context, int index) {
    HomeProvider homeProvider = Provider.of(context, listen: false);
    ModelHeadline model = homeProvider.listHeadlines[index];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: 1060,
      height: model.isExpanded ? 540 : 90,
      padding: const EdgeInsets.symmetric(horizontal: 42),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          image: const DecorationImage(
              opacity: .4,
              image: NetworkImage(
                '${Links.filesUrl}/bg.jpg',
              ),
              fit: BoxFit.fitWidth)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16,),
          Row(
            children: [
              IconButtonWidget(
                icon: Icons.play_arrow_rounded,
                voidCallback: () {
                  setState(() {
                    model.isExpanded = !model.isExpanded;
                  });
                },
              ),
              Text(model.title),
              const Spacer(),
              Text(model.time,
                  style: const TextStyle(
                    fontFamily: 'vazir',
                    fontWeight: FontWeight.bold,
                  )),
              IconButtonWidget(
                icon: model.isExpanded
                    ? Icons.arrow_downward_rounded
                    : Icons.arrow_drop_up_sharp,
                voidCallback: () {
                  setState(() {
                    model.isExpanded = !model.isExpanded;
                  });
                },
              ),
            ],
          ),
          if(model.isExpanded)
            const SizedBox(height: 16,),
          if(model.isExpanded)
            Expanded(
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    child: Card(
                      margin: const EdgeInsets.all(4),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)
                      ),
                      color:Colors.amber,
                      child: Stack(

                        children: [
                          Image.network('${Links.filesUrl}/bg.jpg', fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          const Center(
                            child: Icon(Icons.play_arrow_rounded),
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(model.title),
                  Text(model.complete ? "": "در حال ضبط"),

                ],
              ),
            ),
        ],
      ),
    );
  }
}
