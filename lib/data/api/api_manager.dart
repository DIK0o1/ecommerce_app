import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/request/Login_request.dart';
import 'package:e_commerce/data/model/response/category_response_dto.dart';
import 'package:e_commerce/data/model/response/login_response_dto.dart';
import 'package:http/http.dart' as http;

import '../../domain/enities/failures_entity.dart';
import '../model/Request/register_request.dart';
import '../model/Response/register_response_dto.dart';
import 'api_constants.dart';


class ApiManager {
  ApiManager._();

  static ApiManager? _apiManager;

  static ApiManager getInstance() {
    _apiManager ??= ApiManager._();
    return _apiManager!;
  }

  Future<Either<FailuresEntity, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerEndPoint);

      var registerRequest = RegisterRequest(
          email: email,
          name: name,
          password: password,
          phone: phone,
          rePassword: rePassword);
      var response = await http.post(url, body: registerRequest.toJson());
      var registerResponse =
          RegisterResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerError(
            errorMessage: registerResponse.error != null
                ? registerResponse.error!.msg
                : registerResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<FailuresEntity, LoginResponseDto>> login(
      String email, String password,) async {
    var connectivityResult =
    await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginEndPoint);

      var loginRequest = LoginRequest(
          email: email,
          password: password,
          );
      var response = await http.post(url, body: loginRequest.toJson());
      var loginResponse =
      LoginResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(ServerError(
            errorMessage: loginResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<FailuresEntity, CategoryResponseDto>> getCategories(
      ) async {
    var connectivityResult =
    await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.CategoriesEndPoint);


      var response = await http.get(url);
      var categoryResponse =
      CategoryResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryResponse);
      } else {
        return Left(ServerError(
            errorMessage: categoryResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }
}
