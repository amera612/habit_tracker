import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_tracker/widgets/add_task_view_body.dart';

import 'package:habit_tracker/widgets/custom_app_bar.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          leadingIcon: Icons.arrow_back_ios_new,
          onLeadingPressed: () => Get.back(),
        ),
      ),

      body: AddTaskViewBody(),
    );
  }
}
