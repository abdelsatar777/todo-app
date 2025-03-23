import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../start/UI/manager/home/home_cubit.dart';
import '../../manager/actions_cubit.dart';
import 'custom_button.dart';
import 'custom_date_picker_field.dart';
import 'custom_text_field.dart';
import 'custom_time_picker_field.dart';

class EditBody extends StatefulWidget {
  final int taskId; // استلام الـ ID للمهمة المراد تعديلها
  final String taskName;
  final String taskDate;
  final String taskTime;

  const EditBody({
    super.key,
    required this.taskId,
    required this.taskName,
    required this.taskDate,
    required this.taskTime,
  });

  @override
  State<EditBody> createState() => _EditBodyState();
}

class _EditBodyState extends State<EditBody> {
  late TextEditingController titleController;
  late TextEditingController timeController;
  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.taskName);
    timeController = TextEditingController(text: widget.taskTime);
    dateController = TextEditingController(text: widget.taskDate);
  }

  void updateTask() {
    final actionsCubit = context.read<ActionsCubit>();
    final homeCubit = context.read<HomeCubit>();

    actionsCubit.updateTask(
      id: widget.taskId,
      name: titleController.text,
      date: dateController.text,
      time: timeController.text,
      homeCubit: homeCubit,
    );

    Navigator.pop(context); // إغلاق الشاشة بعد التحديث
    // AppNotifications.editNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      child: Column(
        children: [
          CustomTextField(controller: titleController, hintText: "Title"),
          CustomTimePickerField(controller: timeController),
          CustomDatePickerField(controller: dateController),
          const SizedBox(height: 10),
          CustomButton(
            onPressed: updateTask,
            text: "Update",
            icon: Icons.update,
          ),
        ],
      ),
    );
  }
}
