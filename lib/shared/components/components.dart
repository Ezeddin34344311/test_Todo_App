import 'package:flutter/material.dart';
import 'package:test_todo_app/shared/styles/my_Theme.dart';

// Fonction to Loading page
void showLoading(BuildContext context, String message,
    {bool isCanceled = true}) {
  showDialog(
      barrierDismissible: isCanceled,
      context: context,
      builder: ((context) {
        return AlertDialog(
          content: CircularProgressIndicator(
            strokeWidth: 2,
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
) {
  showDialog(
    context: context,
    builder: ((context) {
      return AlertDialog(
        content: Text(message),
        actions: [
          TextButton(onPressed: posAction, child: Text(posActionText)),
        ],
      );
    }),
  );
}
