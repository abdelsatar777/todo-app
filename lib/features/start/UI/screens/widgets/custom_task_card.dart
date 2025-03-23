import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/start/UI/screens/widgets/show_custom_dialog.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../actions/UI/manager/actions_cubit.dart';
import '../../../../actions/UI/screens/edit_screen.dart';
import '../../../data/models/tasks_model.dart';
import '../../manager/home/home_cubit.dart';

class CustomTaskCard extends StatelessWidget {
  final TasksModel? task;
  final bool showIcon;

  const CustomTaskCard({super.key, this.showIcon = true, this.task});

  void deleteTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Confirm deletion"),
          content: Text("Are you sure you want to delete this task?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text("No", style: TextStyle(color: Colors.blue)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                final actionCubit = context.read<ActionsCubit>();
                final homeCubit = context.read<HomeCubit>();

                actionCubit.deleteTask(id: task!.id, homeCubit: homeCubit);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("The task was successfully deleted."),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text("Yes", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void completeTask(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    homeCubit.markTaskAsDone(id: task!.id);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("The task has been moved to completed tasks ✅"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showCustomDialog(context: context, tasks: task!),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        decoration: BoxDecoration(
          color:
              Theme.of(
                context,
              ).scaffoldBackgroundColor, // لون الخلفية حسب الثيم
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Theme.of(
                context,
              ).shadowColor.withOpacity(0.2), // لون الظل متغير مع الثيم
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    task!.name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    task!.date,
                    style: TextStyle(fontSize: 18),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            if (showIcon)
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (builder) => EditScreen(
                                taskId: task!.id,
                                taskName: task!.name,
                                taskDate: task!.date,
                                taskTime: task!.time,
                              ),
                        ),
                      );
                    },
                    icon: Icon(Icons.edit, color: AppColors.primaryColor),
                  ),
                  IconButton(
                    onPressed: () => deleteTask(context),
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                  IconButton(
                    onPressed: () => completeTask(context),
                    icon: Icon(Icons.check_circle_outline, color: Colors.green),
                  ),
                ],
              )
            else
              IconButton(
                onPressed: () => deleteTask(context),
                icon: Icon(Icons.delete, color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
