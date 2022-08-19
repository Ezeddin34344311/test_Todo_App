import 'package:flutter/material.dart';





// Fonction to Loading page
void showLoading(BuildContext context,String message) {
  showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox( width:  20,),
              Text(message)
            ],
          ),
        );
      }));
}

// Fonction to head Loading page
void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

// Foction Show Message
void showMessage(
  BuildContext context,
  String message,
  String posActionText,
  VoidCallback posAction,
  {String? negActionText,
  VoidCallback? negAction,
  bool isCancel = false}
) {
  List <Widget> actions = [
          TextButton(onPressed: posAction, child: Text(posActionText)),
        ];
        if(negAction !=  null || negActionText != null){
          actions.add(TextButton(
            onPressed: negAction, 
            child: Text(negActionText!,
            )));
        }

  showDialog(
    barrierDismissible: isCancel,
    context: context,
    builder: ((context) {
      return AlertDialog(
        content: Text(message),
        actions: actions,
      );
    }),
  );
}
