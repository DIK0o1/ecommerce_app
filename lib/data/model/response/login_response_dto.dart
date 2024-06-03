import '../../../domain/enities/auth_result_entity.dart';
import 'user_dto.dart';

/// message : "success"
/// user : {"name":"Abdulrahman Mohamed","email":"abdulrahman11@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NTBlMzQ5ZWI1ZDAyMDE2ZjdhZTk3MiIsIm5hbWUiOiJBYmR1bHJhaG1hbiBNb2hhbWVkIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MTY3OTc1MTgsImV4cCI6MTcyNDU3MzUxOH0.Enk_C3Eq1xUVlGowcAfyItsVDUJKPHh_6kVkn7tVg8Y"

class LoginResponseDto {
  LoginResponseDto({
      this.message, 
      this.user, 
      this.token,
  this.statusMsg});

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;

    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(token: token, userEntity: user?.toUserEntity());
  }

}