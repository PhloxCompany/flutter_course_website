import 'package:flutter/cupertino.dart';
import '../api_service.dart';

class TestRequestProvider extends ChangeNotifier{

  late ApiService api;
  TestRequestProvider(BuildContext context){
    api = ApiService(context);
    print("----------test----------");
    api.post({}, (res){

      print("res inside post => $res");
    });
  }

}