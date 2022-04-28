
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/api_service.dart';
import 'package:flutter_course_phlox/controller/providers/global_setting_provider.dart';
import 'package:flutter_course_phlox/model/model_headline.dart';
import 'package:flutter_course_phlox/model/model_personal_data.dart';
import 'package:flutter_course_phlox/utils/links.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../model/model_configs.dart';

class HomeProvider extends ChangeNotifier{

  final BuildContext _context;
  HomeProvider(this._context){
    apiService = ApiService(_context);
  }

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

      int displayIndex = 0;
      for (var item in _responseListHeadline) {
        var model = ModelHeadline.fromItem(item);
        if(item['type'] == "head"){
          displayIndex++;
          model.index = displayIndex;
        }
        _listHeadline.add(model);
      }
      initVideoControllers();
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

  String? _token;
  void initVideoControllers() {
    _token = _context.read<GlobalSettingProvider>().token;

    for (var element in _listHeadline) {
      if(element.complete){

        switch(element.videoVisibility){
          case VideoVisibility.private:
            if((modelPersonalData?.purchased ?? false) == false &&
                loading == false){
              element.videoController = VideoPlayerController.network(
                  Links.courseUrl + element.id.toString() + ".mp4&token=" + _token!,
              )..initialize().then((_) {
                element.chewieController = ChewieController(
                  videoPlayerController: element.videoController,
                  autoPlay: false,
                  looping: false,
                );
                notifyListeners();
              });
            }
            break;
          case VideoVisibility.public:

            if(_token != null){

              element.videoController = VideoPlayerController.network(
                Links.courseUrl + element.id.toString() + ".mp4&token=" + _token!,
              )..initialize().then((_) {
                element.chewieController = ChewieController(
                  videoPlayerController: element.videoController,
                  autoPlay: false,
                  looping: false,
                );
                notifyListeners();
              });
            }

            break;
          case VideoVisibility.global:
            element.videoController = VideoPlayerController.network(
                Links.courseUrl + element.id.toString() + ".mp4",
            )..initialize().then((_) {
              element.chewieController = ChewieController(
                videoPlayerController: element.videoController,
                autoPlay: false,
                looping: false,
              );
              notifyListeners();
            });
            break;
        }

      }
    }
  }

}