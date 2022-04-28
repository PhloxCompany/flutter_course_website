class ModelConfigs{
  String? coursePrice;
  String? coursePriceWithDiscount;
  String? home;
  String? buyCount;
  String? hasDiscount;

  ModelConfigs({this.coursePrice, this.coursePriceWithDiscount, this.home, this.buyCount, this.hasDiscount});

  ModelConfigs.fromJson(Map<String, dynamic> json) {
    coursePrice = json['course_price'].toString();
    coursePriceWithDiscount = json['course_price_with_discount'].toString();
    home = json['home'].toString();
    buyCount = json['buy_count'].toString();
    hasDiscount = json['has_discount'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['course_price'] = coursePrice;
    data['course_price_with_discount'] = coursePriceWithDiscount;
    data['home'] = home;
    data['buy_count'] = buyCount;
    data['has_discount'] = hasDiscount;
    return data;
  }



}