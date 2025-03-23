import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../manager/home/home_cubit.dart';
import '../task_completed_screen.dart';

class MenuFloatingActionButton extends StatelessWidget {
  const MenuFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      overlayColor: Colors.black,
      overlayOpacity: 0.3,
      children: [
        SpeedDialChild(
          onTap: () => Navigator.pushNamed(context, "add_screen"),
          child: Icon(Icons.add),
          label: "Add Task",
          shape: CircleBorder(),
        ),
        SpeedDialChild(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TaskCompletedScreen()),
            ).then((_) {
              context.read<HomeCubit>().getTasks(); // تحديث المهام عند الرجوع
            });
          },
          child: Icon(Icons.check),
          label: "Task Completed",
          shape: CircleBorder(),
        ),
        SpeedDialChild(
          onTap: () => Navigator.pushNamed(context, "setting_screen"),
          child: Icon(Icons.settings),
          label: "Settings",
          shape: CircleBorder(),
        ),
      ],
    );
  }
}
