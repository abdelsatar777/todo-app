import '../../../data/models/tasks_model.dart';

abstract class HomeState {}

class InitialState extends HomeState {}

class LoadingState extends HomeState {}

class SuccessState extends HomeState {
  final List<TasksModel> tasks;
  final List<TasksModel> completedTasks;

  SuccessState({required this.tasks, required this.completedTasks});
}

class ErrorState extends HomeState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}
