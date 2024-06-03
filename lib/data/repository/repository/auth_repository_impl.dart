import 'package:dartz/dartz.dart';

import '../../../domain/Repository/Data_Source/auth_remote_data_source.dart';
import '../../../domain/enities/auth_result_entity.dart';
import '../../../domain/enities/failures_entity.dart';
import '../../../domain/repository/Repository/auth_repository.dart';


class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<FailuresEntity, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone) {
    return authRemoteDataSource.register(
        name, email, password, rePassword, phone);
  }

  @override
  Future<Either<FailuresEntity, AuthResultEntity>> login(String email, String password) {
    return authRemoteDataSource.login(email, password);
  }
}
