import 'package:shopio_app/api/mapper/auth/user_mapper.dart';
import 'package:shopio_app/domain/entities/auth/response/auth_response.dart';

import '../../model/auth/response/auth_response_dto.dart';

extension AuthResponseMapper on AuthResponseDto{
  AuthResponse convertToAuthResponse(){
    return AuthResponse(
      message: message,
      user: user?.convertToUser(),
      token: token
    );
  }
}