import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:provider/provider.dart';
import 'package:test_todo_app/models/tasks_model.dart';
import 'package:test_todo_app/modules/tasks/tasks_item.dart';
import 'package:test_todo_app/shared/styles/my_Theme.dart';
import 'package:test_todo_app/utils/add_task.dart';

import '../../provider/theme_provider.dart';

class Tasks extends StatefulWidget {
  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<TasksModel> tasks = [];
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectDate,
          firstDate: DateTime.now().subtract(Duration(days: 360)),
          lastDate: DateTime.now().add(Duration(days: 360)),
          onDateSelected: (date) {
            if (selectDate == null) return;
            selectDate = date;
            setState(() {
              
            });
          },
          leftMargin: 20,
          monthColor: theme.initTheme ==ThemeMode.light ? MyTheme.blackColor
                    : MyTheme.whiteColor,
          dayColor: theme.initTheme ==ThemeMode.light ? MyTheme.blackColor
                    : MyTheme.whiteColor,
          activeDayColor: theme.initTheme ==ThemeMode.light ? MyTheme.backAndColorDark
                    : MyTheme.whiteColor,
          activeBackgroundDayColor: theme.initTheme ==ThemeMode.light ? MyTheme.whiteColor
                    : MyTheme.backbottomNavi,

        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot<TasksModel>>(
            stream: getTasksTromFirestore(selectDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              tasks = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemBuilder: (context, index) {
                  return TasksItem(tasks[index]);
                },
                itemCount: tasks.length,
              );
            },
          ),
        )
      ],
    );
  }
}
