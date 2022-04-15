import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/ui/pages/home_page/home_page.dart';

class ApiService {
  static final Dio dio =
      Dio(BaseOptions(baseUrl: "https://api.phloxcompany.com/flutter_course/"));

  BuildContext context;

  ApiService(this.context);

  bool validateResponse(Response response, String tag) {
    if (response.statusCode == 200) {
      // request OK
      return true;
    } else {
      debugPrint("#######################");
      debugPrint("error #response# => $tag");
      debugPrint("response code : ${response.statusCode}");
      debugPrint("response data : ${response.data}");
      debugPrint("#######################");
      if (response.statusCode == 403) {
        // TOKEN EXPIRED
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.routeName, (route) => false);
      }
    }
    return false;
  }

  Future post(body,Function(Response response) done, {String tag = "?api=headline"}) async {
    Response response = await dio.get(tag);
    debugPrint(response.data);
    if (response.statusCode == 200) {
      var _data = json.decode(response.data);
      debugPrint(_data.toString());
      if (validateResponse(response, tag)) {
        debugPrint("hi");
        done(response);

        print("res type => ${done(response).runtimeType}");
      }
    }
  }
}
