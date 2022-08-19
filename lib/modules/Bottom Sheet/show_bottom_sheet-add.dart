import 'package:flutter/material.dart';
import 'package:test_todo_app/layout/home_layout.dart';
import 'package:test_todo_app/models/tasks_model.dart';
import 'package:test_todo_app/shared/components/components.dart';
import '../../utils/add_task.dart';

class ShowModalBottomSheetAdd extends StatefulWidget {
  const ShowModalBottomSheetAdd({Key? key}) : super(key: key);

  @override
  State<ShowModalBottomSheetAdd> createState() =>
      _ShowModalBottomSheetAddState();
}

class _ShowModalBottomSheetAddState extends State<ShowModalBottomSheetAdd> {
  
  var selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();

  TextEditingController taskName = TextEditingController();
  TextEditingController descruption = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add new Task',
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
                    controller:  taskName,
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
            Text('Select time', style: Theme.of(context).textTheme.subtitle1),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: (() {
                  showDate();
                }),
                child: Text(
                    '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: setData, child: const Text('Add Task')),
          ],
        ),
      ),
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

  void setData() {
    /// validation
    if (formKey.currentState!.validate()) {
      /// insert database
      TasksModel task = TasksModel(
          taskName: taskName.text,
          descruption: descruption.text,
          date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);

      // Show Loading Page
      showLoading(
        context, 'Looding...'
      );
      // Add task From Firestore
      addTasksFromFirestore(task).then(
        (value) {
          hideLoading(context);
          showMessage(
            context,
            'Added Successfully',
            'OK',
            () {
              Navigator.popUntil(context, ModalRoute.withName(Home.routeName));
            },
          );
        },
      );
    }
  }
}