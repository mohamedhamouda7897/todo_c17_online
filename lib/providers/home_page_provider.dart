import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_c17_online/core/firebase_functions.dart';
import 'package:todo_c17_online/models/task_model.dart';

class HomePageProvider extends ChangeNotifier {
  List<String> categories = [
    "All",
    "sport",
    "birthday",
    "book_club",
    "exhibition",
    "holiday",
    "meeting",
    "eating",
    "workshop",
    "gaming",
  ];

  List<TaskModel> taskss = [];

  int selectedCategoryIndex = 0;

  changeCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  // getTasks() async {
  //   QuerySnapshot<TaskModel> data;
  //   if (selectedCategoryIndex != 0) {
  //     data = await FirebaseFunctions.getTasks(
  //       category: categories[selectedCategoryIndex],
  //     );
  //   } else {
  //     data = await FirebaseFunctions.getTasks();
  //   }
  //
  //   taskss = data.docs.map((e) => e.data()).toList();
  //   notifyListeners();
  // }

  getTasksStream() {
    FirebaseFunctions.getTasksStream(
      category: selectedCategoryIndex == 0
          ? null
          : categories[selectedCategoryIndex],
    ).listen((event) {
      taskss = event.docs.map((e) => e.data()).toList();
      notifyListeners();
    });
  }

  updateTask(TaskModel task) async {
    await FirebaseFunctions.updateTask(task);
  }
}
