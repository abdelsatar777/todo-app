abstract class ActionsState {}

class InitialState extends ActionsState {}

class LoadingState extends ActionsState {}

class SuccessState extends ActionsState {
  final String id;

  SuccessState({required this.id});
}

class ErrorState extends ActionsState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}
