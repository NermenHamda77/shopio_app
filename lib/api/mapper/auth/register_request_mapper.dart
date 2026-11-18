import '../../../domain/entities/auth/request/register/register_request.dart';
import '../../model/auth/request/register/register_request_dto.dart';

extension RegisterRequestMapper on RegisterRequest{
  RegisterRequestDto convertToRegisterRequestDto(){
    return  RegisterRequestDto(
      email: email,
      name: name,
      password: password,
      phone: phone,
      rePassword: rePassword
    );
  }
}