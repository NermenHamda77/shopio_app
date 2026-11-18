import '../../../../domain/entities/auth/request/register/register_request.dart';
import '../../../../domain/entities/auth/request/sign_in/sign_in_request.dart';
import '../../../../domain/entities/auth/response/auth_response.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> signIn(SignInRequest signInRequest);
  Future<AuthResponse> register(RegisterRequest registerRequest);
}