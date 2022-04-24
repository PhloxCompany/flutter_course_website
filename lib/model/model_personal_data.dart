class ModelPersonalData {
  String? bio;
  String? display_name;
  String? how_find_us;
  bool? man;
  String? profile_url;
  int? user_id;
  int? age;
  bool? purchased;
  String? work;

  ModelPersonalData({
    required this.bio,
    required this.display_name,
    required this.how_find_us,
    required this.man,
    required this.profile_url,
    required this.user_id,
    required this.age,
    required this.purchased,
    required this.work,
  });

  factory ModelPersonalData.fromJson(var item) => ModelPersonalData(
      bio: item['bio'],
      display_name: item['display_name'],
      how_find_us: item['how_find_us'],
      man: item['man'] == 1 ? true : false,
      profile_url: item['profile_url'],
      user_id: item['user_id'],
      age: item['age'],
      purchased: item['purchased'],
      work: item['work'],);
}
