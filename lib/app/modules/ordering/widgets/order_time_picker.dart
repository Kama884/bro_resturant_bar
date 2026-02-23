import 'package:flutter/material.dart';

class OrderTimePicker {
  static Future<TimeOfDay?> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue[900]!, // Header color
            ),
          ),
          child: child!,
        );
      },
    );
    return picked;
  }
}
