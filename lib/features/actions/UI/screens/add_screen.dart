import 'package:flutter/material.dart';
import 'package:todo_app/features/actions/UI/screens/widgets/add_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add New Task", showIcon: false),
      body: AddBody(),
    );
  }
}
