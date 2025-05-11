import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import '../core/constant.dart';
import '../models/task.dart';
import 'bottom_sheet_button.dart';

class BottomSheetContent extends StatelessWidget {
  final Task task;
  const BottomSheetContent({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.put(TaskController());

    return Container(
      padding: const EdgeInsets.only(top: 4),
      height:
          task.isCompleted == 1
              ? MediaQuery.of(context).size.height * 0.24
              : MediaQuery.of(context).size.height * 0.32,
      color: Get.isDarkMode ? darkGreyClr : Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
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
              ],
            ),
          ),
          const Spacer(),
          if (task.isCompleted != 1)
            BottomSheetButton(
              label: "Task Completed",
              onTap: () {
                taskController.markTaskCompleted(task.id!);
                Get.back();
              },
              clr: primaryClr,
            ),
          BottomSheetButton(
            label: "Delete Task",
            onTap: () {
              taskController.delete(task);
              Get.back();
            },
            clr: Colors.red[300]!,
          ),
          const SizedBox(height: 20),
          BottomSheetButton(
            label: "Close",
            onTap: () => Get.back(),
            clr: Colors.red[300]!,
            isClose: true,
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
