import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_tracker/controllers/task_controller.dart';
import 'package:habit_tracker/models/task.dart';

import '../core/constant.dart';
import '../widgets/bottom_sheet_button.dart';

class Helper {
  static Future<DateTime?> getDateFromUser(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 730)),
    );
  }

  static Future<TimeOfDay?> getTimeFromUser(BuildContext context) async {
    return await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  static Widget colorPalette({
    required int selectedIndex,
    required Function(int) onColorTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color", style: titleStyle),
        const SizedBox(height: 5),
        Wrap(
          children: List<Widget>.generate(3, (int index) {
            Color color =
                index == 0
                    ? primaryClr
                    : index == 1
                    ? urgentClr
                    : greenClr;

            return GestureDetector(
              onTap: () => onColorTap(index),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: color,
                  child:
                      selectedIndex == index
                          ? const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 16,
                          )
                          : Container(),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  static void validateData({
    required BuildContext context,
    required TextEditingController titleController,
    required TextEditingController noteController,
    required Task task,
    required TaskController taskController,
  }) {
    if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
      addTaskToDB(task: task, taskController: taskController);
      Get.back();
    } else if (titleController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "Title is Required",
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(Icons.warning_amber_rounded),
      );
    } else if (noteController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "Note is Required",
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(Icons.warning_amber_rounded),
      );
    }
  }

  static Future<void> addTaskToDB({
    required Task task,
    required TaskController taskController,
  }) async {
    int value = await taskController.addTask(task: task);
    log("Task inserted with id = $value");
  }

  // static void showBottomSheet(BuildContext context, Task task) {
  //   final taskController = Get.put(TaskController());

  //   Get.bottomSheet(
  //     Container(
  //       padding: const EdgeInsets.only(top: 4),
  //       height:
  //           task.isCompleted == 1
  //               ? MediaQuery.of(context).size.height * 0.24
  //               : MediaQuery.of(context).size.height * 0.32,
  //       color: Get.isDarkMode ? darkGreyClr : Colors.white,
  //       child: Column(
  //         children: [
  //           Container(
  //             height: 6,
  //             width: 120,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(10),
  //               color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
  //             ),
  //           ),
  //           const Spacer(),
  //           if (task.isCompleted != 1)
  //             BottomSheetButton(
  //               label: "Task Completed",
  //               onTap: () {
  //                 taskController.markTaskCompleted(task.id!);
  //                 Get.back();
  //               },
  //               clr: primaryClr,
  //             ),

  //           BottomSheetButton(
  //             label: "Delete Task",
  //             onTap: () {
  //               taskController.delete(task);
  //               Get.back();
  //             },
  //             clr: Colors.red[300]!,
  //           ),

  //           const SizedBox(height: 20),

  //           BottomSheetButton(
  //             label: "Close",
  //             onTap: () => Get.back(),
  //             clr: Colors.red[300]!,
  //             isClose: true,
  //           ),

  //           const SizedBox(height: 15),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
