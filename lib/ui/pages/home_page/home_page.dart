import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/ui/widgets/animate/phlox_anime.dart';
import 'package:flutter_course_phlox/utils/links.dart';
import '../../widgets/text/extra_bold_text.dart';
import 'home_web_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1080;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 90),
              physics: const BouncingScrollPhysics(),
              controller: ScrollController(
                keepScrollOffset: true,
                debugLabel: "home page scroll view"
              ),
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
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 32,
                  child: Container(
                    width: _isWeb ? 1060 : double.infinity,
                    height: 90,
                      padding: const EdgeInsets.symmetric(horizontal: 42),
                      decoration: const BoxDecoration(
                      image: DecorationImage(
                        opacity: .2,
                          image: NetworkImage(
                            '${Links.filesUrl}/bg.jpg',
                          ),
                          fit: BoxFit.fitWidth)),
                    child: Row(
                      children: [
                        const Text("دوره آنلاین"),
                        const SizedBox(width: 12,),
                        const ExtraBoldText(
                          text: "متخصص فلاتر شو",
                          textSize: 32,
                          color: Colors.black,
                        ),
                        const Spacer(),
                        PhloxAnime(
                          millisecondsDelay: 1500,
                          child: Text('1,700,000',style: TextStyle(
                            fontFamily:'vazir',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough,
                            color: Colors.grey[700],
                            decorationColor: Colors.red,
                            decorationThickness: 3,
                            decorationStyle: TextDecorationStyle.solid
                          )),
                        ),
                        const SizedBox(width: 16,),
                        PhloxAnime(
                          millisecondsDelay: 1800,
                          child: MaterialButton(
                            onPressed: (){},
                            textColor: Colors.white,
                            child: Row(
                              children: [
                                const Text("790",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'vazir'
                                  ),
                                ),
                                Text(" هزار تومان",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[200]!,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'vazir'
                                  ),
                                ),
                              ],
                            ),
                            elevation: 32,
                            padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 16),
                            color: Colors.redAccent.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
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
