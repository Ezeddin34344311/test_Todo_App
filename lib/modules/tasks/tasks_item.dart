import 'package:flutter/material.dart';
import 'package:test_todo_app/models/tasks_model.dart';
import 'package:test_todo_app/modules/Bottom%20Sheet/show_bottom_sheet-add.dart';
import 'package:test_todo_app/modules/edit_screen.dart';
import 'package:test_todo_app/shared/styles/my_Theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:test_todo_app/utils/add_task.dart';

class TasksItem extends StatefulWidget {
  TasksModel taskmodel;

  TasksItem(this.taskmodel);

  @override
  State<TasksItem> createState() => _TasksItemState();
}

class _TasksItemState extends State<TasksItem> {
  bool isclicked = false;

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: InkWell(
        onTap: isclicked == false? (() {
          Navigator.pushNamed(context, EditScreen.routeName,
              arguments: widget.taskmodel);
        }) : (){},   
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Slidable(
            startActionPane: ActionPane(
              extentRatio: 0.25,
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    deleteTasksFromFirestore(widget.taskmodel);
                    setState(() {});
                  },
                  borderRadius: BorderRadius.circular(12),
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                )
              ],
            ),
            child: Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              // ,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: isclicked == true
                                  ? MyTheme.secColor
                                  : MyTheme.pryColor,
                              borderRadius: BorderRadius.circular(4)),
                          height: 60,
                          width: 4,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.taskmodel.taskName,
                              style: isclicked == true
                                  ? Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(color: MyTheme.secColor)
                                  : Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(color: MyTheme.pryColor),
                            ),
                            Text(widget.taskmodel.descruption,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: MyTheme.blackColor)),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        isclicked = true;
                        setState(() {});
                      },
                      child: isclicked == false
                          ? Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: MyTheme.pryColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Icon(
                                Icons.check,
                                color: MyTheme.whiteColor,
                                size: 28,
                              ),
                            )
                          : Text(
                              'Done!',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: MyTheme.secColor),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
