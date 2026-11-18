import 'package:injectable/injectable.dart';
import 'package:shopio_app/data/data_sources/auth/remote/auth_remote_data_source.dart';
import 'package:shopio_app/domain/entities/auth/request/register/register_request.dart';
import 'package:shopio_app/domain/entities/auth/request/sign_in/sign_in_request.dart';
import 'package:shopio_app/domain/entities/auth/response/auth_response.dart';
import 'package:shopio_app/domain/repositoy/auth/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) {
    return _remoteDataSource.register(registerRequest);
  }

  @override
  Future<AuthResponse> signIn(SignInRequest signInRequest) {
    return _remoteDataSource.signIn(signInRequest);
  }
  
}