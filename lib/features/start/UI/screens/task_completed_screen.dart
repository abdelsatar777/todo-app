import 'package:flutter/material.dart';
import 'package:todo_app/features/start/UI/screens/widgets/task_completed_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class TaskCompletedScreen extends StatelessWidget {
  const TaskCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Task Completed", showIcon: false),
      body: TaskCompletedBody(),
    );
  }
}
