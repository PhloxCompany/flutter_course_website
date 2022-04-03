class ModelConfigs{
  String? coursePrice;
  String? coursePriceWithDiscount;
  String? home;
  String? buyCount;

  ModelConfigs({this.coursePrice, this.coursePriceWithDiscount, this.home, this.buyCount});

  ModelConfigs.fromJson(Map<String, dynamic> json) {
    coursePrice = json['course_price'];
    coursePriceWithDiscount = json['course_price_with_discount'];
    home = json['home'];
    buyCount = json['buy_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['course_price'] = coursePrice;
    data['course_price_with_discount'] = coursePriceWithDiscount;
    data['home'] = home;
    data['buy_count'] = buyCount;
    return data;
  }



}