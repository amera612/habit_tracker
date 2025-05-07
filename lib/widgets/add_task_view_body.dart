import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_tracker/controllers/task_controller.dart';
import 'package:habit_tracker/core/constant.dart';
import 'package:habit_tracker/core/helper.dart';
import 'package:habit_tracker/models/task.dart';
import 'package:habit_tracker/widgets/custom_button.dart';
import 'package:intl/intl.dart';
import 'custom_text_field.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  final TaskController taskController = Get.put(TaskController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  int selectReminder = 5;
  List<int> reminders = [5, 10, 15, 20];
  String selectedRepeat = 'None';
  List<String> repeats = ['None', 'Daily', 'Weekly', 'Monthly'];
  int selectedIndex = 0;

  void pickDate() async {
    DateTime? pickerDate = await Helper.getDateFromUser(context);
    if (pickerDate != null) {
      setState(() {
        selectedDate = pickerDate;
      });
    }
  }

  Future<void> pickTime({required bool isStartTime}) async {
    final TimeOfDay? picked = await Helper.getTimeFromUser(context);
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add Task", style: headingStyle),
            CustomTextField(
              hint: "Enter Your Title",
              title: "Title",
              controller: titleController,
            ),
            CustomTextField(
              hint: "Enter Your Note",
              title: "Note",
              controller: noteController,
            ),
            CustomTextField(
              hint: DateFormat.yMd().format(selectedDate),
              title: "Date",
              widget: IconButton(
                onPressed: () {
                  pickDate();
                },
                icon: Icon(Icons.calendar_today_outlined),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hint: startTime.format(context),
                    title: "Start Time",
                    widget: IconButton(
                      onPressed: () {
                        pickTime(isStartTime: true);
                      },
                      icon: Icon(Icons.access_time),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomTextField(
                    hint: endTime.format(context),
                    title: "End Time",
                    widget: IconButton(
                      onPressed: () {
                        pickTime(isStartTime: false);
                      },
                      icon: Icon(Icons.access_time),
                    ),
                  ),
                ),
              ],
            ),
            CustomTextField(
              title: "Reminder",
              hint: "$selectReminder minutes early",
              widget: DropdownButton(
                iconSize: 20,
                elevation: 4,
                style: subTitleStyle,
                icon: const Icon(Icons.keyboard_arrow_down, color: primaryClr),
                items:
                    reminders.map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList(),
                underline: Container(height: 0),
                onChanged: (String? value) {
                  setState(() {
                    selectReminder = int.parse(value!);
                  });
                },
              ),
            ),
            CustomTextField(
              title: "Repeat",
              hint: selectedRepeat,
              widget: DropdownButton(
                iconSize: 20,
                elevation: 4,
                style: subTitleStyle,
                icon: const Icon(Icons.keyboard_arrow_down, color: primaryClr),
                items:
                    repeats.map<DropdownMenuItem<String>>((String? value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value!),
                      );
                    }).toList(),
                underline: Container(height: 0),
                onChanged: (String? value) {
                  setState(() {
                    selectedRepeat = value!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Helper.colorPalette(
                    selectedIndex: selectedIndex,
                    onColorTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  CustomButton(
                    label: "Create Task",
                    onTap: () {
                      final task = Task(
                        title: titleController.text,
                        note: noteController.text,
                        date: DateFormat.yMd().format(selectedDate),
                        startTime: startTime.format(context),
                        endTime: endTime.format(context),
                        color: selectedIndex,
                        remind: selectReminder,
                        repeat: selectedRepeat,
                        isCompleted: 0,
                      );

                      Helper.validateData(
                        context: context,
                        titleController: titleController,
                        noteController: noteController,
                        task: task,
                        taskController: taskController,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  addTaskToDB() async {
    int value = await taskController.addTask(
      task: Task(
        title: titleController.text,
        note: noteController.text,
        date: DateFormat.yMd().format(DateTime.now()),
        startTime: startTime.format(context),
        endTime: endTime.format(context),
        color: selectedIndex,
        remind: selectReminder,
        repeat: selectedRepeat,
        isCompleted: 0,
      ),
    );
    print(
      "\n mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm my id is $value\n",
    );
  }
}
