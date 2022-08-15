import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:test_todo_app/modules/tasks/tasks_item.dart';
import 'package:test_todo_app/shared/styles/my_Theme.dart';

class Tasks extends StatelessWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 360)),
          lastDate: DateTime.now().add(Duration(days: 360)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: MyTheme.blackColor,
          dayColor: MyTheme.blackColor,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: MyTheme.pryColor,
          
        ),
        const SizedBox(height: 20,),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20,
              );
            },
            itemBuilder: (context, index) {
              return TasksItem();
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
