import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../core/theme.dart';

class ThemeService {
  final box = GetStorage();
  final key = 'isDarkMode';

  bool loadTheme() => box.read(key) ?? false;

  ThemeMode get theme => loadTheme() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    bool isDark = loadTheme();
    box.write(key, !isDark);
    Get.changeTheme(!isDark ? Themes.dark : Themes.light);
  }
}
