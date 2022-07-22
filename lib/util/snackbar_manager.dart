import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

abstract class SnackBarManager {
  void showMessage({required BuildContext context, required String title, required String message, required ContentType contentType});
}

class SnackBarManagerImpl implements SnackBarManager {

  @override
  void showMessage({
    required BuildContext context,
    required String title,
    required String message,
    required ContentType contentType
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: title,
              message: message,
              contentType: contentType,
            )
        )
    );
  }
}
