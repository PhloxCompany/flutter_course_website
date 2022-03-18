import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_course_phlox/model/model_headline.dart';

class HomeProvider extends ChangeNotifier{

  bool loading = true;
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://api.phloxcompany.com/flutter_course/"
  ));
  final List<ModelHeadline> _listHeadline = [];

  List<ModelHeadline> get listHeadlines => _listHeadline;

  Future<void> requestHeadline() async {
    Response response =
    await _dio.get("?api=headline");
    debugPrint(response.data);
    if (response.statusCode == 200) {
      var _data = json.decode(response.data);
      var _responseListHeadline = _data['list'];

      for (var item in _responseListHeadline) {
        _listHeadline.add(ModelHeadline.fromItem(item));
      }

      loading = false;
      notifyListeners();
    }
  }

  void toggleListTile(ModelHeadline model) {
    model.isExpanded = !model.isExpanded;
    notifyListeners();
  }

}