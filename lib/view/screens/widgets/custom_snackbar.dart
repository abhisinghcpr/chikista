import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbarWidget extends StatelessWidget {
  final String title;
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final Duration duration;
  final SnackPosition snackPosition;

  CustomSnackbarWidget({
    required this.title,
    required this.message,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.duration = const Duration(seconds: 3),
    this.snackPosition = SnackPosition.BOTTOM,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.snackbar(
          title,
          message,
          snackPosition: snackPosition,
          backgroundColor: backgroundColor,
          colorText: textColor,
          duration: duration,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          snackStyle: SnackStyle.FLOATING,
        );
      },
      child: Text('Show Custom Snackbar'),
    );
  }
}
