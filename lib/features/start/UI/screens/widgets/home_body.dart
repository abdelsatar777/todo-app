import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../manager/home/home_cubit.dart';
import '../../manager/home/home_state.dart';
import 'custom_task_card.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getTasks(); // تحميل المهام عند فتح الصفحة
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is SuccessState) {
          if (state.tasks.isEmpty) {
            return const Center(
              child: Text("No Tasks Added", style: TextStyle(fontSize: 20)),
            );
          } else {
            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomTaskCard(task: state.tasks[index]),
                );
              },
            );
          }
        } else if (state is ErrorState) {
          return Center(
            child: Text(state.errorMsg, style: const TextStyle(fontSize: 20)),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        }
      },
    );
  }
}
