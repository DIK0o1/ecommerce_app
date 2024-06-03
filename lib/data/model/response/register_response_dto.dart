import '../../../domain/enities/auth_result_entity.dart';
import 'error.dart';
import 'user_dto.dart';


class RegisterResponseDto {
  RegisterResponseDto({
    this.message,
    this.user,
    this.error,
    this.statusMsg,
    this.token,
  });

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    error =
        json['errors'] != null ? ErrorResponse.fromJson(json['errors']) : null;

    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  String? statusMsg;
  UserDto? user;
  String? token;

  ErrorResponse? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;

    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (error != null) {
      map['errors'] = error?.toJson();
    }

    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(token: token, userEntity: user?.toUserEntity());
  }
}
