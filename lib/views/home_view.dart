import 'package:flutter/material.dart';

import 'package:habit_tracker/services/theme_service.dart';
import 'package:habit_tracker/widgets/custom_app_bar.dart';

import '../widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          leadingIcon: Icons.nightlight_rounded,
          onLeadingPressed: () {
            ThemeService().switchTheme();
          },
        ),
      ),
      body: const HomeViewBody(),
    );
  }
}
