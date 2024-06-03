import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repository/Repository/auth_repository.dart';


import '../enities/auth_result_entity.dart';
import '../enities/failures_entity.dart';

class LoginUseCase{

  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});
  Future<Either<FailuresEntity, AuthResultEntity>> invoke(
      String email, String password) {
    return authRepository.login( email, password);
  }
}