import 'package:get/get.dart';

import 'package:habit_tracker/db/db_helper.dart';
import 'package:habit_tracker/models/task.dart';

class TaskController extends GetxController {
  var taskList = <Task>[].obs;

  @override
  void onReady() {
    super.onReady();
  }

  Future<int> addTask({Task? task}) async {
    //🫵🫵🫵🫵A
    taskList.add(task!);
    return await DbHelper.insert(task!);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DbHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }
  void delete(Task task)async{
    await DbHelper.delete(task);
    getTasks();

  }
  void markTaskCompleted(int id)async{
    await DbHelper.update(id);
    getTasks();
  }
}
