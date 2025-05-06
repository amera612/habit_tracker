import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant.dart';

class Helper {
  static Future<DateTime?> getDateFromUser(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime.now().add(Duration(days: 365)),
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

  static void validateData(
    BuildContext context,
    TextEditingController titleController,
    TextEditingController noteController,
  ) {
    if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
      Get.back();
    } else if (titleController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "Title is Required",
        snackPosition: SnackPosition.BOTTOM,
        // backgroundColor: Colors.white,
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
}
