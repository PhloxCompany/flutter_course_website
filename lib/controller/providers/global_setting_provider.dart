import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalSettingProvider extends ChangeNotifier {
  SharedPreferences preference;

  GlobalSettingProvider(this.preference);

  bool get darkMode =>
      preference.getBool("dark") ?? (themeMode == ThemeMode.dark);

  ThemeMode themeMode = ThemeMode.system;

  void changeThemeMode() =>
      {preference.setBool("dark", !darkMode), notifyListeners()};

  ScrollController scrollController = ScrollController();

  void scrollToHeadline() => scrollController.animateTo(800,
      duration: const Duration(seconds: 2), curve: Curves.ease);
}
