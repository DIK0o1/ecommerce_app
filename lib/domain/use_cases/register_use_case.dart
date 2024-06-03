import 'package:dartz/dartz.dart';

import '../enities/auth_result_entity.dart';
import '../enities/failures_entity.dart';
import '../repository/Repository/auth_repository.dart';


class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<FailuresEntity, AuthResultEntity>> invoke(String name,
      String email, String password, String rePassword, String phone) {
    return authRepository.register(name, email, password, rePassword, phone);
  }
}
