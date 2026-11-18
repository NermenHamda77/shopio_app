import 'package:shopio_app/core/exceptions/app_exceptions.dart';
import 'package:shopio_app/domain/entities/auth/response/auth_response.dart';

sealed class AuthStates {}
class AuthLoadingState extends AuthStates{}
class AuthErrorState extends AuthStates{
  AppExceptions exception;
  AuthErrorState({required this.exception});
}
class AuthSuccessState extends AuthStates{
  AuthResponse authResponse;
  AuthSuccessState({required this.authResponse});
}