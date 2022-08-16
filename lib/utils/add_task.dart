import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/tasks_model.dart';

/// Fonction Add Collection

CollectionReference<TasksModel> addCollectionForFirestore() {
  return FirebaseFirestore.instance
      .collection('task')
      .withConverter<TasksModel>(fromFirestore: ((snapshot, options) {
    return TasksModel.fromJson(snapshot.data()!);
  }), toFirestore: ((task, options) {
    return task.toJson();
  }));
}

/// Fonction add Document and write Data

Future<void> addTasksFromFirestore(TasksModel task) {
  var docRef = addCollectionForFirestore().doc();
  task.id = docRef.id;
  return docRef.set(task);
}


/// Fonction Add Document and Read Data

Future<QuerySnapshot<TasksModel>> getTasksTromFirestore(DateTime date){

  var collection =addCollectionForFirestore();
    return collection
    .where('date',
  isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch).get();

}