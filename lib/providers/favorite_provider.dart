import 'package:flutter/material.dart';
import 'package:todo_c17_online/core/firebase_functions.dart';
import 'package:todo_c17_online/models/task_model.dart';

class FavoriteProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];

  getTasks() {
    FirebaseFunctions.getFavoriteTasks().listen((event) {
      tasks = event.docs.map((e) => e.data()).toList();
      notifyListeners();
    });
  }

  updateTask(TaskModel task) async {
    await FirebaseFunctions.updateTask(task);
  }
}
