import 'package:injectable/injectable.dart';
import 'package:shopio_app/domain/entities/auth/request/register/register_request.dart';
import 'package:shopio_app/domain/entities/auth/response/auth_response.dart';
import 'package:shopio_app/domain/repositoy/auth/auth_repository.dart';
@injectable
class RegisterUseCase {
  final AuthRepository _authRepository;
  RegisterUseCase({required this._authRepository});

  Future<AuthResponse> invoke(RegisterRequest registerRequest){
    return _authRepository.register(registerRequest);
  }
}