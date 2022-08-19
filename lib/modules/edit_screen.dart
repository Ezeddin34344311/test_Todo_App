import 'package:flutter/material.dart';
import 'package:test_todo_app/models/tasks_model.dart';
import 'package:test_todo_app/shared/components/components.dart';

import 'package:test_todo_app/shared/styles/my_Theme.dart';
import 'package:test_todo_app/utils/add_task.dart';

class EditScreen extends StatefulWidget {
  static const String routeName = 'Show Bottom Sheet Edit';

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var selectedDate = DateTime.now();

  TextEditingController taskName = TextEditingController();
  TextEditingController descruption = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //manipulation data a partir du Navigator
    var editData = ModalRoute.of(context)!.settings.arguments as TasksModel;
    taskName.text = editData.taskName;
    descruption.text = editData.descruption;
    selectedDate = DateTime.fromMillisecondsSinceEpoch(editData.date);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Todo App',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        Column(children: [
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 4,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
              child: Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'EditTask',
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: taskName,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Plz enter your task name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter  task name',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.black54),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: descruption,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Plz enter your descruption';
                              }
                              return null;
                            },
                            maxLines: 4,
                            minLines: 4,
                            decoration: InputDecoration(
                              hintText: 'Enter  descruption',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Select time',
                        style: Theme.of(context).textTheme.subtitle1),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: (() => showDate()),
                        child: Text(
                            '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black)),
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    ElevatedButton(
                      onPressed: () => updateData(),
                      child: Text('Save Change',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: MyTheme.whiteColor)),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(14),
                          primary: MyTheme.pryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ],
    );
  }

  void showDate() async {
    var chooseDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 360)));

    if (chooseDate != null) {
      selectedDate = chooseDate;
      setState(() {});
    }
  }

  void updateData() {
    if (formKey.currentState!.validate()) {
      TasksModel task = TasksModel(
          taskName: taskName.text,
          descruption: descruption.text,
          date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);

      showLoading(context, 'Looding...');

      updateTasksFromFirestore(task).then((value) {
        showMessage(
            context, 'Tasks is Update', 'OK', () => Navigator.pop(context));
      }).onError((error, stackTrace) {
        print(error);
      });
    }
  }
}