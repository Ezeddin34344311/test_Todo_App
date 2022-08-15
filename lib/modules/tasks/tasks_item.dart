import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_todo_app/shared/styles/my_Theme.dart';

class TasksItem extends StatelessWidget {
  const TasksItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin:const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding:const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: MyTheme.pryColor,
                      borderRadius: BorderRadius.circular(4)),
                  height: 60,
                  width: 4,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text('Name Task',
                    style: Theme.of(context).textTheme.subtitle1,),
                    Row(
                      children: [
                        Icon(Icons.timeline),
                        Text('10:30'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: 60,
              height: 30,
            decoration: BoxDecoration(
              color: MyTheme.pryColor,
              borderRadius: BorderRadius.circular(8)
            ),
              child: Icon(Icons.check,
              color: MyTheme.whiteColor,
              size: 28,))
          ],
        ),
      ),
    );
  }
}
