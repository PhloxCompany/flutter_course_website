import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ModelHeadline {

  int id;
  String title;
  String? des;
  bool complete;
  String time;
  int sortId;
  VideoVisibility videoVisibility;
  bool isPlay = false;
  bool isExpanded = false;
  late VideoPlayerController videoController;
  ChewieController? chewieController;

  ModelHeadline(
      {required this.id,
      required this.title,
      required this.des,
      required this.complete,
      required this.videoVisibility,
      required this.time,
      required this.sortId,
      });

  factory ModelHeadline.fromItem(var item) => ModelHeadline(
      id: item['id'],
      title: item['head_title'],
    des: item['des'],
      complete: item['is_completed'] == 1,
      videoVisibility: VideoVisibility.values[item['video_visibility']],
      time: item['time'],
      sortId: item['sortId'],
  );
}

enum VideoVisibility{
  private,
  public,
  global,
}