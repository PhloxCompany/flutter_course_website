class ModelPersonalData {
  String? bio;
  String? display_name;
  String? how_find_us;
  String? man;
  String? profile_url;
  int? user_id;

  ModelPersonalData({required this.bio,
    required this.display_name,
    required this.how_find_us,
    required this.man,
    required this.profile_url,
    required this.user_id});

  factory ModelPersonalData.fromJson(var item) =>
      ModelPersonalData(bio: item['bio'],
          display_name: item['display_name'],
          how_find_us: item['how_find_us'],
          man: item['man'],
          profile_url: item['profile_url'],
          user_id: item['user_id']);
}