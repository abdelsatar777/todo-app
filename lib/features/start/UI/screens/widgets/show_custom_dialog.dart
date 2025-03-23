import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/tasks_model.dart';

void showCustomDialog({
  required BuildContext context,
  required TasksModel tasks,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(tasks.name, style: TextStyle(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tasks.date),
            SizedBox(height: 8),
            Text(tasks.time),
            SizedBox(height: 8),
            Text(tasks.state.toUpperCase()),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryColor,
            ),
            child: Text("Close"),
          ),
        ],
      );
    },
  );
}
