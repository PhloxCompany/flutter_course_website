import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/ui/widgets/animate/phlox_anime.dart';
import 'package:flutter_course_phlox/ui/widgets/button/border_button_widget.dart';
import 'package:flutter_course_phlox/ui/widgets/button/button_black.dart';
import 'package:flutter_course_phlox/ui/widgets/button/icon_button_widget.dart';
import 'package:flutter_course_phlox/ui/widgets/text/bold_text.dart';
import 'package:flutter_course_phlox/ui/widgets/text/extra_bold_text.dart';
import 'package:flutter_course_phlox/ui/widgets/text/text_li_widget.dart';
import 'package:phlox_animations/phlox_animations.dart';

class HomeWebPage extends StatelessWidget {
  const HomeWebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                image: AssetImage(
                  'assets/images/bg.jpg',
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
                    const PhloxAnime(child: Text("با تدریس بابک قهرمان زاده"), millisecondsDelay: 1300,),
                    const SizedBox(
                      height: 46,
                    ),
                    Row(
                      children: [
                        PhloxAnime(child: ButtonBlack(onPressed: () {}, text: "ثبت نام در دوره"),
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
                    child: Image.asset(
                      'assets/images/man.png',
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
                        child: TextLiWidget(text: "پیاده سازی دیتابیس Sqlite  در فلاتر")),
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
                        child: TextLiWidget(text: "آشنایی با انیمیشن در فلاتر")),
                    PhloxAnime(
                        millisecondsDelay: 2250,
                        child: TextLiWidget(text: "آشنایی کامل با State Management ها")),
                    PhloxAnime(
                      millisecondsDelay: 2350,
                      child: TextLiWidget(
                          text: "انتشار اپلیکیشن ها در مارکت های ایرانی و جهانی"),
                    ),
                    PhloxAnime(
                          millisecondsDelay: 2450,
                        child: TextLiWidget(text: "پیاده سازی نقشه Open Street Map")),
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
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 32,
              child: Container(
                width: 1060,
                height: 90,
                padding: const EdgeInsets.symmetric(horizontal: 42),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: .2,
                        image: AssetImage(
                          'assets/images/bg.jpg',
                        ),
                        fit: BoxFit.fitWidth)),
                child: Row(
                  children: [
                    IconButtonWidget(
                      icon: Icons.play_arrow_rounded,
                      voidCallback: () {},
                    ),
                    const Text("آموزش زبان دارت"),
                    const Spacer(),
                    const Text('10 دقیقه',
                        style: TextStyle(
                          fontFamily: 'vazir',
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
