import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'package:habit_tracker/controllers/task_controller.dart';
import 'package:habit_tracker/services/theme_service.dart';
import 'package:habit_tracker/widgets/add_data_section.dart';
import 'package:habit_tracker/widgets/add_task_section.dart';
import 'package:habit_tracker/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';

import '../core/constant.dart';
import '../models/task.dart';
import '../widgets/TaskTile.dart';

// import '../services/notifcation.service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
      backgroundColor: Theme.of(context).colorScheme.surface, //🫵🫵🫵🫵s
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
            AddTask(taskController),
            AddDataSection(
              selectedDate: selectedDate,
              onDateChange: (newDate) {
                setState(() {
                  selectedDate = newDate;
                });
              },
            ),
            SizedBox(height: 15),
            showTasks(),
          ],
        ),
      ),
    );
  }

  showTasks() {
    return Obx(() {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: taskController.taskList.length,
        itemBuilder: (_, index) {
          Task task = taskController.taskList[index];
          //print(task.toJson());
          if (task.repeat == 'Daily') {
            DateTime date = DateFormat.jm().parse(task.startTime.toString());
            //var myTime =DateFormat("HH:mm").format(date);
            //notifyHelper.scheduledNotificatinon();
            return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                child: FadeInAnimation(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _ShowBottomSheet(context, task);
                        },
                        child: TaskTile(task),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (task.date == DateFormat.yMd().format(selectedDate)) {
            return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                child: FadeInAnimation(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _ShowBottomSheet(context, task);
                        },
                        child: TaskTile(task),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      );
    });
  }
}

_ShowBottomSheet(BuildContext context, Task task) {
  final taskController = Get.put(TaskController());

  Get.bottomSheet(
    Container(
      padding: EdgeInsets.only(top: 4),
      height:
          task.isCompleted == 1
              ? MediaQuery.of(context).size.height * 0.24
              : MediaQuery.of(context).size.height * 0.32,
      color: Get.isDarkMode ? darkGreyClr : Colors.white,
      child: Column(
        children: [
          Container(
            height: 6,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
            ),
          ),
          Spacer(),
          task.isCompleted == 1
              ? Container()
              : _bottomSheetButton(
                Label: "Task Completed",
                onTap: () {
                  taskController.markTaskCompleted(task.id!);
                  Get.back();
                },
                clr: primaryClr,
                context: context,
              ),
          _bottomSheetButton(
            Label: "Delete Task",
            onTap: () {
              taskController.delete(task);
              Get.back();
            },
            clr: Colors.red[300]!,
            context: context,
          ),
          SizedBox(height: 20),
          _bottomSheetButton(
            Label: "Close Task",
            onTap: () {
              Get.back();
            },
            clr: Colors.red[300]!,
            isClose: true,
            context: context,
          ),
          SizedBox(height: 15),
        ],
      ),
    ),
  );
}

_bottomSheetButton({
  required String Label,
  required Function()? onTap,
  required Color clr,
  bool isClose = false,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      height: 55,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color:
              isClose == true
                  ? Get.isDarkMode
                      ? Colors.grey[600]!
                      : Colors.grey[300]!
                  : clr,
        ),
        borderRadius: BorderRadius.circular(20),
        color: isClose == true ? Colors.transparent : clr,
      ),
      child: Center(
        child: Text(
          Label,
          style:
              isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
        ),
      ),
    ),
  );
}
