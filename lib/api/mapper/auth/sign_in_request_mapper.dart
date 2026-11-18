import 'package:shopio_app/api/model/auth/request/sign_in/sign_in_request_dto.dart';
import 'package:shopio_app/domain/entities/auth/request/sign_in/sign_in_request.dart';

extension SignInRequestMapper on SignInRequest{
  SignInRequestDto convertToSignInRequestDto(){
    return SignInRequestDto(
      email: email,
      password: password,
    );
  }
}