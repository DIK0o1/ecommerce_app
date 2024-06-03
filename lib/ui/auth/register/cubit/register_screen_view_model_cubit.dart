
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/use_cases/register_use_case.dart';
import 'register_screen_view_model_state.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  // todo: hold data
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController =
  TextEditingController();
  TextEditingController confirmationPasswordController =
  TextEditingController();
  TextEditingController emailController =
  TextEditingController();
  TextEditingController phoneController =
  TextEditingController();
  bool isObscure = true;
  late RegisterUseCase registerUseCase;

// todo: handle functions
  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        confirmationPasswordController.text,
        phoneController.text);

    either.fold((l) {
      emit(RegisterErrorState(errorMessage: l.errorMessage));
    }, (r) {
      emit(RegisterSuccessState(authResultEntity: r));
    });
  }
}
