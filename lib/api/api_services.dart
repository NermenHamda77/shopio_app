import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopio_app/api/model/auth/request/register/register_request_dto.dart';
import 'package:shopio_app/api/model/auth/request/sign_in/sign_in_request_dto.dart';
import 'package:shopio_app/api/model/auth/response/auth_response_dto.dart';

import 'end_points.dart';

part 'api_services.g.dart';

@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(EndPoints.signInApi)
  Future<AuthResponseDto> signIn(@Body() SignInRequestDto signInRequestDto);


  @POST(EndPoints.registerApi)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequestDto);

}
