class ModelHeadline {
  int id;
  String title;
  bool complete;
  String time;
  int sortId;
  bool isPublic;
  bool isPlay = false;
  bool isExpanded = false;

  ModelHeadline({
    required this.id,
    required this.title,
    required this.complete,
    required this.isPublic,
    required this.time,
    required this.sortId});
}
