import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/local/app_db.dart';
import '../../../data/models/tasks_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AppDB? appDB;

  HomeCubit({required this.appDB}) : super(InitialState());

  Future<void> getTasks() async {
    emit(LoadingState());
    if (appDB == null) {
      emit(ErrorState(errorMsg: "Database not initialized"));
      return;
    }
    try {
      var data = await appDB!.getDataInDB();
      List<TasksModel> tasks =
          data
              .map((e) => TasksModel.fromMap(e))
              .where((task) => task.state != "done")
              .toList();

      var completedData = await appDB!.getCompletedTasks();
      List<TasksModel> completedTasks =
          completedData.map((e) => TasksModel.fromMap(e)).toList();

      emit(SuccessState(tasks: tasks, completedTasks: completedTasks));
    } catch (error) {
      emit(ErrorState(errorMsg: error.toString()));
    }
  }

  Future<void> markTaskAsDone({required int id}) async {
    await appDB!.markTaskAsDone(id: id);
    getTasks(); // تحديث المهام بعد التعديل
  }

  Future<void> getCompletedTasks() async {
    emit(LoadingState());
    if (appDB == null) {
      emit(ErrorState(errorMsg: "Database not initialized"));
      return;
    }
    try {
      var completedData = await appDB!.getCompletedTasks();
      List<TasksModel> completedTasks =
          completedData.map((e) => TasksModel.fromMap(e)).toList();

      // نحافظ على المهام غير المكتملة بدلاً من إفراغها
      var currentState = state;
      if (currentState is SuccessState) {
        emit(
          SuccessState(
            tasks: currentState.tasks,
            completedTasks: completedTasks,
          ),
        );
      } else {
        emit(SuccessState(tasks: [], completedTasks: completedTasks));
      }
    } catch (error) {
      emit(ErrorState(errorMsg: error.toString()));
    }
  }
}
