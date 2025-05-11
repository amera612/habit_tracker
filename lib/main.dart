import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:habit_tracker/db/db_helper.dart';

import 'package:habit_tracker/views/home_view.dart';
import 'core/theme.dart';
import 'services/theme_service.dart';
import 'views/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    bool isFirstTime = box.read("isFirstTime") ?? true;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: isFirstTime ? const OnboardingView() : const HomeView(),
    );
  }
}
