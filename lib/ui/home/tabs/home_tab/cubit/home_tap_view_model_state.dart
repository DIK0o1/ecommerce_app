part of 'home_tap_view_model_cubit.dart';

@immutable
sealed class HomeTapViewModelState {}

final class HomeTapViewModelInitial extends HomeTapViewModelState {}
final class HomeTapViewModelLoading extends HomeTapViewModelState {
  String? loadingMessage;

  HomeTapViewModelLoading({required this.loadingMessage});
}
final class HomeTapViewModelError extends HomeTapViewModelState {
  FailuresEntity? errors;

  HomeTapViewModelError({required this.errors});
}
final class HomeTapViewModelSuccess extends HomeTapViewModelState {
  CategoryResponseEntity categoryResponseEntity;

  HomeTapViewModelSuccess({required this.categoryResponseEntity});
}



