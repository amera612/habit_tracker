import 'package:flutter/material.dart';
import 'package:habit_tracker/core/constant.dart';

import 'custom_text_field.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Text("ADD TASK", style: headingStyle),
            CustomTextField(hint: "Enter Your Title", title: "Title"),
          ],
        ),
      ),
    );
  }
}
