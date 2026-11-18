import 'package:injectable/injectable.dart';
import 'package:shopio_app/api/api_services.dart';
import 'package:shopio_app/api/mapper/auth/auth_response_mapper.dart';
import 'package:shopio_app/api/mapper/auth/register_request_mapper.dart';
import 'package:shopio_app/api/mapper/auth/sign_in_request_mapper.dart';
import 'package:shopio_app/data/data_sources/auth/remote/auth_remote_data_source.dart';
import 'package:shopio_app/domain/entities/auth/request/register/register_request.dart';
import 'package:shopio_app/domain/entities/auth/request/sign_in/sign_in_request.dart';
import 'package:shopio_app/domain/entities/auth/response/auth_response.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final ApiServices _apiServices;

  AuthRemoteDataSourceImpl(this._apiServices);

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    //todo: RegisterRequest => RegisterRequestDto
   var response = await _apiServices.register(registerRequest.convertToRegisterRequestDto());
   
   //todo: AuthResponseDto => AuthResponse
   return response.convertToAuthResponse();
  }

  @override
  Future<AuthResponse> signIn(SignInRequest signInRequest) async {
    //todo: SignInRequest => SignInRequestDto
    var response = await _apiServices.signIn(signInRequest.convertToSignInRequestDto());

    //todo: AuthResponseDto => AuthResponse
    return response.convertToAuthResponse();
  }
}