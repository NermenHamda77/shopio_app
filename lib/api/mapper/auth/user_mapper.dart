import 'package:shopio_app/api/model/auth/response/user_dto.dart';
import 'package:shopio_app/domain/entities/auth/response/user.dart';

extension UserMapper on UserDto{
  User convertToUser(){
    return User(
      name: name,
      email: email,
    );
  }
}