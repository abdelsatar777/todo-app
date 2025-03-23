import 'package:flutter/material.dart';
import 'package:todo_app/features/actions/UI/screens/widgets/edit_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class EditScreen extends StatelessWidget {
  final int taskId;
  final String taskName;
  final String taskDate;
  final String taskTime;

  const EditScreen({
    super.key,
    required this.taskId,
    required this.taskName,
    required this.taskDate,
    required this.taskTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Edit Task", showIcon: false),
      body: EditBody(
        taskId: taskId,
        taskName: taskName,
        taskDate: taskDate,
        taskTime: taskTime,
      ),
    );
  }
}
