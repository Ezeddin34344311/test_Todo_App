// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_todo_app/layout/home_layout.dart';
import 'package:test_todo_app/models/tasks_model.dart';
import 'package:test_todo_app/shared/components/components.dart';
import 'package:test_todo_app/shared/styles/my_theme.dart';
import '../../provider/language_provider.dart';
import '../../provider/theme_provider.dart';
import '../../utils/add_task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    // ignore: unused_local_variable
    var language = Provider.of<LanguageProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.add_new_task,
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: taskName,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.erreur_task_name;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.task_name,
                        hintStyle:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: theme.initTheme == ThemeMode.light
                                      ? Colors.black54
                                      : Colors.white54,
                                ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: descruption,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.erreur_descipton;
                        }
                        return null;
                      },
                      maxLines: 4,
                      minLines: 4,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.description,
                        hintStyle:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: theme.initTheme == ThemeMode.light
                                      ? Colors.black54
                                      : Colors.white54,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(AppLocalizations.of(context)!.select_time,
                  style: Theme.of(context).textTheme.subtitle1),
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
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: theme.initTheme == ThemeMode.light
                                ? MyTheme.blackColor
                                : MyTheme.whiteColor,
                          )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: setData,
                  child: Text(AppLocalizations.of(context)!.add_task)),
            ],
          ),
        ),
      ),
    );
  }

  void showDate() async {
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 360)),
    );

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
        context,
        AppLocalizations.of(context)!.loading,
      );
      // Add task From Firestore
      addTasksFromFirestore(task).then(
        (value) {
          hideLoading(context);
          showMessage(
            context,
            AppLocalizations.of(context)!.message_comp_add,
            AppLocalizations.of(context)!.posAction_components,
            () {
              Navigator.popUntil(context, ModalRoute.withName(Home.routeName));
            },
          );
        },
      );
    }
  }
}
