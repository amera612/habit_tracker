import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:habit_tracker/controllers/task_controller.dart';
import 'package:habit_tracker/services/theme_service.dart';
import 'package:habit_tracker/widgets/add_data_section.dart';
import 'package:habit_tracker/widgets/add_task_section.dart';
import 'package:habit_tracker/widgets/custom_app_bar.dart';

// import '../services/notifcation.service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final NotificationService notificationService = NotificationService();
  final taskController = Get.put(TaskController());
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    // notificationService.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          leadingIcon: Icons.nightlight_rounded,
          onLeadingPressed: () async {
            ThemeService().switchTheme();
            // await NotificationService().showNotification(
            //   "Theme Changed",
            //   "The app theme has been updated.",
            // );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddTask(),
            AddDataSection(
              selectedDate: selectedDate,
              onDateChange: (newDate) {
                setState(() {
                  selectedDate = newDate;
                });
              },
            ),

            showTasks(),
          ],
        ),
      ),
    );
  }

  showTasks() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
          itemCount: taskController.taskList.length,
          itemBuilder: (_, context) {
            return Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              width: 100,
              height: 100,
              color: Colors.amber,
            );
          },
        );
      }),
    );
  }
}
