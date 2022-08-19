import 'package:flutter/material.dart';
import 'package:test_todo_app/shared/styles/my_Theme.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Language',
            style: Theme.of(context).textTheme.headline2!.
            copyWith(color: MyTheme.blackColor),),
            SizedBox(height: 20,),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: MyTheme.whiteColor,
                padding: EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  side:BorderSide(
                    color: MyTheme.pryColor
                  ) ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('English'), Icon(Icons.check_sharp)],
              ),
            ),
            SizedBox(height: 25,),
            Text('Thiming',
            style: Theme.of(context).textTheme.headline2!.
            copyWith(color: MyTheme.blackColor),),
            SizedBox(height: 20,),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: MyTheme.whiteColor,
                padding: EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  side:BorderSide(
                    color: MyTheme.pryColor
                  ) ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Light'), Icon(Icons.check_sharp)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
