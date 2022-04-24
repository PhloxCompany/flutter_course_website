import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/global_setting_provider.dart';
import 'package:flutter_course_phlox/ui/pages/home_page/home_page.dart';
import 'package:flutter_course_phlox/utils/utils.dart';
import 'package:provider/provider.dart';

class ApiService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://api.phloxcompany.com/flutter_course/",
    ),
  );

  BuildContext context;

  ApiService(this.context);

  void validateResponse(Response response, String tag) {

    var _data = json.decode(response.data);
    debugPrint(_data.toString());
    if (_data['result'] == true||_data['status'] == 200) {
      // request OK
      return;
    } else {
      Utils.showToast(_data['msg']);

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
  }

  Future get(
      {required String url,
      required Function(dynamic response) res}) async {
    Response response = await dio.get(url, queryParameters: {
      "token": context.read<GlobalSettingProvider>().token ?? ""
    });
    validateResponse(response, url);
    var _data = json.decode(response.data);
    res(_data);
  }

  Future post(
      {required String url,
      var body,
      required Function(dynamic response) res}) async {
    Response response = await dio.post(url,
        data: FormData.fromMap(body),
        queryParameters: {
          "token": context.read<GlobalSettingProvider>().token ?? ""
        });
    validateResponse(response, url);
    var _data = json.decode(response.data);
    res(_data);
  }
}
