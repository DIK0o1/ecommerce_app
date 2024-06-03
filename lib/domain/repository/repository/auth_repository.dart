import 'package:dartz/dartz.dart';

import '../../enities/auth_result_entity.dart';
import '../../enities/failures_entity.dart';

abstract class AuthRepository {
  Future<Either<FailuresEntity, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<FailuresEntity, AuthResultEntity>> login(
      String email, String password, );
}
