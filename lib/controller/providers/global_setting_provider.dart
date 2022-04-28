import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalSettingProvider extends ChangeNotifier {
  SharedPreferences preference;

  GlobalSettingProvider(this.preference);

  bool get darkMode =>
      preference.getBool("dark") ?? (themeMode == ThemeMode.dark);

  String? get token => preference.getString("token");


  ThemeMode themeMode = ThemeMode.system;

  void changeThemeMode() =>
      {preference.setBool("dark", !darkMode), notifyListeners()};

  ScrollController scrollController = ScrollController();

  void scrollToHeadline(bool web) =>
      scrollController.animateTo(web ? 700 : 1200,
          duration: const Duration(seconds: 2), curve: Curves.ease);

  void scrollToPrice(BuildContext context)  =>
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 2), curve: Curves.ease);

  set setToken(String token) =>
      {preference.setString("token", token), notifyListeners()};

  Future<void> removeToken() async{
    await preference.remove('token');
  }

}
