import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_todo_app/models/tasks_model.dart';

class ReadDataProvider extends ChangeNotifier {
  List<TasksModel> tasks = [];

  void tasksProvider(QuerySnapshot<TasksModel> tasksModel,
      AsyncSnapshot<QuerySnapshot<TasksModel>> snapshot) {
    tasks = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

    notifyListeners();
  }
}
