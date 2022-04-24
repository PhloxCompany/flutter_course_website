
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/api_service.dart';
import 'package:flutter_course_phlox/model/model_headline.dart';
import 'package:flutter_course_phlox/model/model_personal_data.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/model_configs.dart';

class HomeProvider extends ChangeNotifier{

  HomeProvider(BuildContext _context){
    apiService = ApiService(_context);
  }

  ChewieController? chewieController;


  bool loading = true;

  ApiService? apiService;
  List<ModelHeadline> _listHeadline = [];

  ModelPersonalData? modelPersonalData;

  List<ModelHeadline> get listHeadlines => _listHeadline;

  ModelConfigs? modelConfigs;

  Future<void> requestHeadline() async {
    _listHeadline = [];

    apiService!.get(url: "?api=headline",
        res: (data){
      var _responseListHeadline = data['list'];

      for (var item in _responseListHeadline) {
        _listHeadline.add(ModelHeadline.fromItem(item));
      }
      modelConfigs = ModelConfigs.fromJson(data['configData']);
      if(data['personalData'] != null){
        modelPersonalData = ModelPersonalData.fromJson(data['personalData']);
      }
      loading = false;
      notifyListeners();
    });
  }

  void toggleListTile(ModelHeadline model) {
    model.isExpanded = !model.isExpanded;
    notifyListeners();
  }

  void startPay() {

    apiService!.get(url: "payment.php", res: (data) async{
      if(data["result"]){
        if(await canLaunch(data['url'])){
          await launch(data['url']);
        }else {
          throw 'Could not launch ${data['url']}';
        }
      }
    });

  }

}