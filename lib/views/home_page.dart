import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/custom_app_bar.dart';

// import '../services/notifcation.service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final NotificationService notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    // notificationService.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(),
      ),
      body: Column(
        children: [
          Text('ameraaa', style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
