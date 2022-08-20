import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_todo_app/models/tasks_model.dart';
import 'package:test_todo_app/modules/edit_screen.dart';
import 'package:test_todo_app/shared/components/components.dart';
import 'package:test_todo_app/shared/styles/my_theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:test_todo_app/utils/add_task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../provider/language_provider.dart';
import '../../provider/theme_provider.dart';

// ignore: must_be_immutable
class TasksItem extends StatefulWidget {
  TasksModel taskmodel;

// ignore: use_key_in_widget_constructors
TasksItem(this.taskmodel);

  @override
  State<TasksItem> createState() => _TasksItemState();
}

class _TasksItemState extends State<TasksItem> {
  bool isclicked = false;
  late NavigatorState navigator;

  @override
  // ignore: must_call_super
  void didChangeDependencies() {
    navigator = Navigator.of(context);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    // ignore: unused_local_variable
    var language = Provider.of<LanguageProvider>(context);
    // ignore: avoid_unnecessary_containers
    return Container(
      child: InkWell(
        onTap: isclicked == false
            ? (() {
                Navigator.pushNamed(context, EditScreen.routeName,
                    arguments: widget.taskmodel);
              })
            : () {},
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Slidable(
            startActionPane: ActionPane(
              extentRatio: 0.25,
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    showMessage(
                        context,
                        AppLocalizations.of(context)!.message_comp_delete,
                        AppLocalizations.of(context)!.posAction_components,
                        (() {
                      deleteTask();
                      navigator.pop(context);
                    }),
                        negActionText:
                            AppLocalizations.of(context)!.negAction_components,
                        negAction: () => navigator.pop(context),
                        isCancel: true);
                  },
                  borderRadius: BorderRadius.circular(12),
                  backgroundColor:const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: AppLocalizations.of(context)!.delete,
                )
              ],
            ),
            child: Card(
              color: theme.initTheme == ThemeMode.light
                  ? MyTheme.whiteColor
                  : MyTheme.backbottomNavi,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
                                    .copyWith(
                                      color: theme.initTheme == ThemeMode.light
                                          ? MyTheme.blackColor
                                          : MyTheme.whiteColor,
                                    )),
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
                              AppLocalizations.of(context)!.is_done,
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

  void deleteTask() {
    deleteTasksFromFirestore(widget.taskmodel);
    setState(() {});
  }
}
