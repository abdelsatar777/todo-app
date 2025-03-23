import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../start/UI/manager/home/home_cubit.dart';
import '../../manager/actions_cubit.dart';
import 'custom_button.dart';
import 'custom_date_picker_field.dart';
import 'custom_text_field.dart';
import 'custom_time_picker_field.dart';

class AddBody extends StatefulWidget {
  const AddBody({super.key});

  @override
  State<AddBody> createState() => _AddBodyState();
}

class _AddBodyState extends State<AddBody> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  void sendNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        actionType: ActionType.Default,
        title: 'Done',
        body: 'Task Added',
      ),
    );
  }

  void addTask() {
    final actionsCubit = context.read<ActionsCubit>();
    final homeCubit = context.read<HomeCubit>(); // جلب HomeCubit لتحديث القائمة

    actionsCubit.addNewTask(
      name: titleController.text,
      date: dateController.text,
      time: timeController.text,
      homeCubit: homeCubit, // تمرير homeCubit ليتم تحديثه بعد الإضافة
    );

    Navigator.pop(context); // إغلاق شاشة الإضافة بعد الحفظ
    sendNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      child: Column(
        children: [
          CustomTextField(controller: titleController, hintText: "Title"),
          CustomDatePickerField(controller: dateController),
          CustomTimePickerField(controller: timeController),
          const SizedBox(height: 10),
          CustomButton(onPressed: addTask, text: "Add", icon: Icons.add),
        ],
      ),
    );
  }
}
