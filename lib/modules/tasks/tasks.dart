import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:test_todo_app/models/tasks_model.dart';
import 'package:test_todo_app/modules/tasks/tasks_item.dart';
import 'package:test_todo_app/shared/styles/my_Theme.dart';
import 'package:test_todo_app/utils/add_task.dart';

class Tasks extends StatelessWidget {
 
  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 360)),
          lastDate: DateTime.now().add(Duration(days: 360)),
          onDateSelected: (date) {
             date= date ;
          },
          leftMargin: 20,
          monthColor: MyTheme.blackColor,
          dayColor: MyTheme.blackColor,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: MyTheme.pryColor,
          
        ),
        const SizedBox(height: 20,),
        Expanded(
          child: FutureBuilder<QuerySnapshot<TasksModel>>(
            future: getTasksTromFirestore(date),
            builder: (context, snapshot) {

              List<TasksModel> tasks =
               snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              return ListView.builder(itemBuilder:  (context, index) {
                return TasksItem(tasks[index]);
              },itemCount: tasks.length,);
            },
          ),
        )
      ],
    );
  }
}
