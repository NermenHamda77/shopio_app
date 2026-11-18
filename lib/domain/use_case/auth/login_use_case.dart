import 'package:injectable/injectable.dart';
import 'package:shopio_app/domain/entities/auth/request/sign_in/sign_in_request.dart';
import 'package:shopio_app/domain/entities/auth/response/auth_response.dart';
import 'package:shopio_app/domain/repositoy/auth/auth_repository.dart';

@injectable
class LoginUseCase {
  final AuthRepository _authRepository;
  LoginUseCase({required this._authRepository});

  Future<AuthResponse> invoke(SignInRequest signInRequest){
    return _authRepository.signIn(signInRequest);
  }
}