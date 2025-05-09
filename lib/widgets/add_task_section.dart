import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_tracker/controllers/task_controller.dart';
import 'package:habit_tracker/views/add_task_view.dart';
import 'package:habit_tracker/widgets/custom_button.dart';
import 'package:intl/intl.dart';

import '../core/constant.dart';

class AddTask extends StatelessWidget {
  const AddTask(TaskController taskController, {super.key});

  get taskController => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ), //symmetric(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text("Today", style: headingStyle),
            ],
          ),
          CustomButton(
            label: '+ Add Task',
            onTap: () async {
              await Get.to(AddTaskView());
              taskController.getTask();
            },
          ),
        ],
      ),
    );
  }
}
