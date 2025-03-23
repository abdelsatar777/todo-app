import 'package:flutter/material.dart';
import 'package:todo_app/core/widgets/custom_app_bar.dart';
import 'package:todo_app/features/other/UI/screens/widgets/setting_body.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Setting", showIcon: false),
      body: SettingBody(),
    );
  }
}
