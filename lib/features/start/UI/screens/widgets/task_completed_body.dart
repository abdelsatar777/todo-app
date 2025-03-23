import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_task_card.dart';
import '../../manager/home/home_cubit.dart';
import '../../manager/home/home_state.dart';

class TaskCompletedBody extends StatefulWidget {
  const TaskCompletedBody({super.key});

  @override
  State<TaskCompletedBody> createState() => _TaskCompletedBodyState();
}

class _TaskCompletedBodyState extends State<TaskCompletedBody> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getCompletedTasks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is SuccessState) {
          if (state.completedTasks.isEmpty) {
            return Center(
              child: Text("No Completed Tasks", style: TextStyle(fontSize: 20)),
            );
          } else {
            return ListView.builder(
              itemCount: state.completedTasks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomTaskCard(
                    task: state.completedTasks[index],
                    showIcon: false,
                  ),
                );
              },
            );
          }
        } else if (state is ErrorState) {
          return Center(
            child: Text(state.errorMsg, style: TextStyle(fontSize: 20)),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
