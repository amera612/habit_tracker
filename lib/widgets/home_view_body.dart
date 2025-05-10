import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_tracker/controllers/task_controller.dart';
import 'package:habit_tracker/models/task.dart';
import 'package:habit_tracker/widgets/add_data_section.dart';
import 'package:habit_tracker/widgets/add_task_section.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';

import 'TaskTile.dart';
import 'bottom_sheet_content.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final taskController = Get.put(TaskController());
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          const SizedBox(height: 15),
          _showTasks(),
        ],
      ),
    );
  }

  Widget _showTasks() {
    return Obx(() {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: taskController.taskList.length,
        itemBuilder: (_, index) {
          Task task = taskController.taskList[index];

          if (task.repeat == 'Daily' ||
              task.date == DateFormat.yMd().format(selectedDate)) {
            return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                child: FadeInAnimation(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(BottomSheetContent(task: task));
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
