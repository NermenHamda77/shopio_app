import 'package:shopio_app/domain/entities/auth/request/register/register_request.dart';
import 'package:shopio_app/domain/entities/auth/request/sign_in/sign_in_request.dart';
import 'package:shopio_app/domain/entities/auth/response/auth_response.dart';


abstract class AuthRepository {
  Future<AuthResponse> signIn(SignInRequest signInRequest);
  Future<AuthResponse> register(RegisterRequest registerRequest);
}