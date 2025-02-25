import 'package:dartz/dartz.dart';

import '../../../domain/Repository/Data_Source/auth_remote_data_source.dart';
import '../../../domain/enities/auth_result_entity.dart';
import '../../../domain/enities/failures_entity.dart';
import '../../api/api_manager.dart';


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<FailuresEntity, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var either =
        await apiManager.register(name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r.toAuthResultEntity());
    });
  }

  @override
  Future<Either<FailuresEntity, AuthResultEntity>> login(String email, String password) async {
    var either =
    await apiManager.login( email, password, );
    return either.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r.toAuthResultEntity());
    });

  }
}
