import 'package:e_commerce/domain/dependency_injection.dart';
import 'package:e_commerce/ui/auth/login/cubit/login_screen_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Utils/dialog_utils.dart';
import '../../utils/my_colors.dart';
import '../../utils/text_field_item.dart';
import '../register/register_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginScreenViewModelCubit viewModelCubit = LoginScreenViewModelCubit(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: viewModelCubit,
        listener: (context, state){
          if (state is LoginLoadingState) {
            DialogUtils.showLoading(
                context, "loading.....");
          } else if (state is LoginErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context, state.errorMessage!);
          } else if (state is LoginSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context,
                state.authResultEntity?.userEntity?.name ?? "",title: 'Success');
          }
        },
      child: Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 87.h, left: 97.w, right: 97.w),
                  child: Image.asset(
                    'assets/images/Route.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Welcome Back To Route',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 24.sp),
                      ),
                      Text(
                        'Please sign in with your mail',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 16.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Form(
                          key: viewModelCubit.formKey,
                          child: Column(
                            children: [
                              TextFieldItem(
                                fieldName: 'E-mail address',
                                hintText: 'enter your email address',
                                controller: viewModelCubit.emailController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'please enter your email address';
                                  }
                                  bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value);
                                  if (!emailValid) {
                                    return 'invalid email';
                                  }
                                  return null;
                                },
                              ),
                              TextFieldItem(
                                fieldName: 'Password',
                                hintText: 'enter your password',
                                controller: viewModelCubit.passwordController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'please enter password';
                                  }
                                  if (value.trim().length < 6 ||
                                      value.trim().length > 30) {
                                    return 'password should be >6 & <30';
                                  }
                                  return null;
                                },
                                isObscure: viewModelCubit.isObscure,
                                suffixIcon: InkWell(
                                  child: viewModelCubit.isObscure
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onTap: () {
                                    if (viewModelCubit.isObscure) {
                                      viewModelCubit.isObscure = false;
                                    } else {
                                      viewModelCubit.isObscure = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Forgot Password',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.whiteColor),
                        textAlign: TextAlign.end,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.h),
                        child: ElevatedButton(
                          onPressed: () {
                            viewModelCubit.login();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.whiteColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15.r)))),
                          child: Container(
                            height: 64.h,
                            width: 398.w,
                            child: Center(
                              child: Text(
                                'Login',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 20.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t have an account? ',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(RegisterScreen.routeName);
                              },
                              child: Text(
                                'Create Account',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
