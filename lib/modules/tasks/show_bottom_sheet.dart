import 'package:flutter/material.dart';
import 'package:test_todo_app/models/tasks_model.dart';

class ShowModalBottomSheet extends StatefulWidget {
  const ShowModalBottomSheet({Key? key}) : super(key: key);

  @override
  State<ShowModalBottomSheet> createState() => _ShowModalBottomSheetState();
}

class _ShowModalBottomSheetState extends State<ShowModalBottomSheet> {
  String taskName = '';
  String descruption = '';
  DateTime selectedDate = DateTime.now() ;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add new Task',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20,),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (text) {
                    print('task name : $text');
                    taskName= text;
                    
                  },
                    validator: (text) {
                      if (text == null || text.isEmpty){
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
                    onChanged: (text) {
                      descruption = text;
                      print('descruption : $text');
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty){
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
            const SizedBox(height: 20,),
            Text('Select time',
                  style :Theme.of(context).textTheme.subtitle1),
            const SizedBox(height: 20,),
            Center(
              child: InkWell(
                      onTap: (() {
                        showDate();
                      }),
                      child: Text('selectedDate',
                      style :Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.black
                      )),
                    ),
            ),
             const SizedBox(height: 20,),
            ElevatedButton(
             onPressed: getData,
             child:const Text('Add Task'))
          ],
        ),
      ),
    );
  }

  void showDate(){
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate:DateTime.now() ,
      lastDate: DateTime.now().add(Duration(days: 360)));
      
      
   
  }

  void getData(){
    /// validation data
    formKey.currentState!.validate();

  }
 
}
