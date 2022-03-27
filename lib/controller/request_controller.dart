import 'package:dio/dio.dart';

class RequestController {
  static final Dio dio = Dio(BaseOptions(
      baseUrl: "https://api.phloxcompany.com/flutter_course/"
  ));
}