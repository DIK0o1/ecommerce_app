import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/use_cases/login_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../domain/enities/auth_result_entity.dart';

part 'login_screen_view_model_state.dart';

class LoginScreenViewModelCubit extends Cubit<LoginScreenViewModelState> {

  LoginScreenViewModelCubit({required this.loginUseCase})
      : super(LoginInitialState());
  LoginUseCase loginUseCase;
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  bool isObscure = true;
  void login() async {
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(
        emailController.text, passwordController.text);
    either.fold((l) {
      emit(LoginErrorState(errorMessage: l.errorMessage));
    }, (r) {
      emit(LoginSuccessState(authResultEntity: r));
    });
  }
}
