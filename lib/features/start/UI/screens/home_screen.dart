import 'package:flutter/material.dart';
import 'package:todo_app/features/start/UI/screens/widgets/home_body.dart';
import 'package:todo_app/features/start/UI/screens/widgets/menu_floating_action_button.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "TO-DO App"),
      floatingActionButton: MenuFloatingActionButton(),
      body: HomeBody(),
    );
  }
}
