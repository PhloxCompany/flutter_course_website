part of "./home_page.dart";

final Widget _babak = Center(
  child: Container(
    alignment: Alignment.center,
    constraints: const BoxConstraints(maxWidth: 640),
    child: PhloxAnime(
      millisecondsDelay: 1720,
      child: Image.network(
        '${Links.filesUrl}man.png',
        width: double.infinity,
        fit: BoxFit.contain,
      ),
    ),
  ),
);

final Widget _listLi2 = Column(
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
);