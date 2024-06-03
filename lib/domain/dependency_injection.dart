

import 'package:e_commerce/data/repository/repository/home_tap_repository_impl.dart';
import 'package:e_commerce/domain/repository/Repository/auth_repository.dart';
import 'package:e_commerce/domain/repository/data_source/home_tap_remote_data_source.dart';
import 'package:e_commerce/domain/repository/repository/home_tap_repository.dart';
import 'package:e_commerce/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/domain/use_cases/register_use_case.dart';

import '../data/api/api_manager.dart';
import '../data/repository/data_source/auth_remote_data_source_imp.dart';
import '../data/repository/data_source/home_remote_data_source_imp.dart';
import '../data/repository/repository/auth_repository_impl.dart';
import 'Repository/Data_Source/auth_remote_data_source.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepository());
}
LoginUseCase injectLoginUseCase(){
  return LoginUseCase(authRepository: injectAuthRepository());
}
GetAllCategoriesUseCase injectGetAllCategoriesUseCase(){
  return GetAllCategoriesUseCase(homeTapRepository: injectHomeRepository());
}
HomeTapRepository injectHomeRepository(){
  return HomeTapRepositoryImpl(homeTapRemoteDataSource: injectHomeTapRemoteDataSource());
}
HomeTapRemoteDataSource injectHomeTapRemoteDataSource(){
  return HomeRemoteDataSourceImp(apiManager: ApiManager.getInstance());
}
AuthRepository injectAuthRepository() {
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
