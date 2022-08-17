import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:provider/provider.dart';
import 'package:test_todo_app/models/tasks_model.dart';
import 'package:test_todo_app/modules/tasks/tasks_item.dart';
import 'package:test_todo_app/provider/read_data_provider.dart';
import 'package:test_todo_app/shared/styles/my_Theme.dart';
import 'package:test_todo_app/utils/add_task.dart';

class Tasks extends StatefulWidget {
 
  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  var selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var read_data_provider = Provider.of<ReadDataProvider>(context);
    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectDate,
          firstDate: DateTime.now().subtract(Duration(days: 360)),
          lastDate: DateTime.now().add(Duration(days: 360)),
          onDateSelected: (date) {
            if(date == null) return ;

             selectDate= date ;
             setState(() {
               
             });
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
            future: getTasksTromFirestore(selectDate),
            builder: (context, snapshot) {
          
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20,);
                },
                itemBuilder:  (context, index) {
                return TasksItem(read_data_provider.tasks[index]);
              },itemCount: read_data_provider.tasks.length,);
            },
          ),
        )
      ],
    );
  }
}
