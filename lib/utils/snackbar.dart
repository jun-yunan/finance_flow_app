import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackBarStyle { error, success, info, warning, none }

void showSnackbar({
  required String message,
  SnackBarStyle? style = SnackBarStyle.none,
  String? title,
  Duration? duration,
}) {
  var snackBarDetails = getSnackbarStyle(style);
  Get.snackbar(
    title ?? snackBarDetails['title']!,
    message,
    icon: snackBarDetails['icon'] as Icon?,
    backgroundColor: snackBarDetails['backgroundColor'] as Color?,
    colorText: snackBarDetails['colorText'] as Color?,
    duration: duration ?? const Duration(seconds: 3),
    messageText: Text(
      message,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: snackBarDetails['colorText'] as Color?,
      ),
    ),
  );
}

Map<String, dynamic> getSnackbarStyle(SnackBarStyle? style) {
  switch (style) {
    case SnackBarStyle.success:
      return {
        'title': 'Success',
        'icon': Icon(Icons.check_circle, size: 30, color: Colors.green[800]),
        'backgroundColor': Colors.green[100],
        'colorText': Colors.green[800],
      };
    case SnackBarStyle.error:
      return {
        'title': 'Error',
        'icon': const Icon(Icons.error, size: 30, color: Colors.white),
        'backgroundColor': Colors.red,
        'colorText': Colors.white,
      };
    case SnackBarStyle.info:
      return {
        'title': 'Info',
        'icon': Icon(Icons.info, size: 30, color: Colors.blue[800]),
        'backgroundColor': Colors.blue[100],
        'colorText': Colors.blue[800],
      };
    case SnackBarStyle.warning:
      return {
        'title': 'Warning',
        'icon': Icon(Icons.warning, size: 30, color: Colors.orange[800]),
        'backgroundColor': Colors.orange[100],
        'colorText': Colors.orange[800],
      };
    case SnackBarStyle.none:
    default:
      return {
        'title': '',
        'icon': null,
        'backgroundColor': null,
        'colorText': null,
      };
  }
}
