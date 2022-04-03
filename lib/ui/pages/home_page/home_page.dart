import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/home_provider.dart';
import 'package:flutter_course_phlox/ui/widgets/animate/phlox_anime.dart';
import 'package:flutter_course_phlox/utils/links.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import '../../widgets/text/extra_bold_text.dart';
import 'home_web_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    var numFormat = intl.NumberFormat("0,000");
    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1024;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.amber.shade50,
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 90),
              controller: ScrollController(
                  keepScrollOffset: true, debugLabel: "home page scroll view"),
              child: const Center(
                child: HomeWebPage(),
              ),
            ),
            Align(
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
                    height: _isWeb ? 90 : 70,
                    padding: EdgeInsets.symmetric(horizontal: _isWeb ? 42 : 14),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            opacity: .4,
                            image: NetworkImage(
                              '${Links.filesUrl}/bg.jpg',
                            ),
                            fit: BoxFit.fitWidth),),
                    child: Row(
                      children: [
                        if (width > 400) const Text("دوره آنلاین"),
                        const SizedBox(
                          width: 12,
                        ),
                        ExtraBoldText(
                          text: "متخصص فلاتر شو",
                          textSize: _isWeb ? 32 : 18,
                          color: Colors.black,
                        ),
                        const Spacer(),
                        Consumer<HomeProvider>(
                          builder: (context, value, child) =>
                              value.modelConfigs == null
                                  ? const CircularProgressIndicator()
                                  : PhloxAnime(
                                      millisecondsDelay: 1500,
                                      child: Text(
                                          numFormat.format(double.parse(value
                                              .modelConfigs!.coursePrice!)),
                                          style: TextStyle(
                                              fontFamily: 'vazir',
                                              fontSize: _isWeb ? 22 : 14,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.grey[700],
                                              decorationColor: Colors.red,
                                              decorationThickness: 3,
                                              decorationStyle:
                                                  TextDecorationStyle.solid)),
                                    ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        PhloxAnime(
                          millisecondsDelay: 1800,
                          child: MaterialButton(
                            onPressed: () {},
                            textColor: Colors.white,
                            elevation: 32,
                            padding: EdgeInsets.symmetric(
                                horizontal: _isWeb ? 42 : 24, vertical: 16),
                            color: Colors.grey[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Row(
                              children: [
                                Consumer<HomeProvider>(
                                    builder: (context, value, child) =>
                                        value.modelConfigs == null
                                            ? const CircularProgressIndicator()
                                            : Text(
                                                numFormat.format(double.parse(value
                                                    .modelConfigs!
                                                    .coursePriceWithDiscount!),),
                                                style: TextStyle(
                                                    fontSize: _isWeb ? 22 : 18,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'vazir'),
                                              ),),
                                // Text(
                                //   " هزار تومان",
                                //   style: TextStyle(
                                //       fontSize: _isWeb ? 12 : 8,
                                //       color: Colors.grey[200]!,
                                //       fontWeight: FontWeight.normal,
                                //       fontFamily: 'vazir'),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
