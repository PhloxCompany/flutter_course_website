import 'package:video_player/video_player.dart';

class ModelHeadline {

  int id;
  String title;
  bool complete;
  String time;
  int sortId;
  VideoVisibility videoVisibility;
  bool isPlay = false;
  bool isExpanded = false;
  late VideoPlayerController videoController;

  ModelHeadline(
      {required this.id,
      required this.title,
      required this.complete,
      required this.videoVisibility,
      required this.time,
      required this.sortId,
      });

  factory ModelHeadline.fromItem(var item) => ModelHeadline(
      id: item['id'],
      title: item['head_title'],
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