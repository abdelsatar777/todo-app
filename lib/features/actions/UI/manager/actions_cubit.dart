import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/local/app_db.dart';
import '../../../start/UI/manager/home/home_cubit.dart';
import 'actions_state.dart';

class ActionsCubit extends Cubit<ActionsState> {
  final AppDB appDB;

  ActionsCubit({required this.appDB}) : super(InitialState());

  addNewTask({
    required String name,
    required String date,
    required String time,
    required HomeCubit homeCubit,
  }) async {
    emit(LoadingState());
    try {
      int id = await appDB.insertInDB(name: name, date: date, time: time);
      emit(SuccessState(id: id.toString()));
      homeCubit.getTasks(); // تحديث المهام بعد الإضافة
    } catch (error) {
      emit(ErrorState(errorMsg: error.toString()));
    }
  }

  updateTask({
    required int id,
    required String name,
    required String date,
    required String time,
    required HomeCubit homeCubit,
  }) async {
    emit(LoadingState());
    try {
      await appDB.updateTask(id: id, name: name, date: date, time: time);
      emit(SuccessState(id: id.toString()));
      homeCubit.getTasks(); // تحديث المهام بعد التحديث
    } catch (error) {
      emit(ErrorState(errorMsg: error.toString()));
    }
  }

  // ✅ **جديد: حذف المهمة**
  deleteTask({required int id, required HomeCubit homeCubit}) async {
    emit(LoadingState());
    try {
      await appDB.deleteTask(id: id);
      emit(SuccessState(id: id.toString()));
      homeCubit.getTasks(); // تحديث القائمة بعد الحذف
    } catch (error) {
      emit(ErrorState(errorMsg: error.toString()));
    }
  }
}
