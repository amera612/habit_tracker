import 'package:flutter/material.dart';

// import '../services/notifcation.service.dart';
import '../services/theme_service.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.nightlight_rounded, size: 20),
        onPressed: () async {
          ThemeService().switchTheme();
          // await NotificationService().showNotification(
          //   "Theme Changed",
          //   "The app theme has been updated.",
          // );
        },
      ),
      actions: [
        IconButton(icon: const Icon(Icons.person, size: 20), onPressed: () {}),
      ],
    );
  }
}
