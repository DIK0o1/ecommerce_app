part of 'login_screen_view_model_cubit.dart';

@immutable
abstract class LoginScreenViewModelState {}

class LoginInitialState extends LoginScreenViewModelState {}

class LoginLoadingState extends LoginScreenViewModelState {}

class LoginSuccessState extends LoginScreenViewModelState {
  AuthResultEntity? authResultEntity;

  LoginSuccessState({required this.authResultEntity});
}

class LoginErrorState extends LoginScreenViewModelState {
  String? errorMessage;

  LoginErrorState({required this.errorMessage});
}
