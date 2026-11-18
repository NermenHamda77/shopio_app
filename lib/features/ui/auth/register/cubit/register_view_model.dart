import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopio_app/core/exceptions/app_exceptions.dart';
import 'package:shopio_app/domain/entities/auth/request/register/register_request.dart';
import 'package:shopio_app/domain/entities/auth/request/sign_in/sign_in_request.dart';
import 'package:shopio_app/domain/use_case/auth/login_use_case.dart';
import 'package:shopio_app/domain/use_case/auth/register_use_case.dart';
import 'package:shopio_app/features/ui/auth/auth_states.dart';

@injectable
class RegisterViewModel extends Cubit<AuthStates>{
  final RegisterUseCase _registerUseCase;
  RegisterViewModel( this._registerUseCase):super(AuthLoadingState());
  Future<void> register({
    required String email ,
    required String password,
    required String userName ,
    required String rePassword,
    required String phone ,
  }) async {
    try{
      emit(AuthLoadingState());
      RegisterRequest registerRequest = RegisterRequest(
          email: email,
          name: userName,
          phone: phone,
          rePassword: rePassword,
          password: password
      );
      var response = await _registerUseCase.invoke(registerRequest);
      emit(AuthSuccessState(authResponse:  response));

    }on DioException catch(e){
      String message = (e.error is AppExceptions)
          ? (e.error as AppExceptions).message
          : "Unexpected Error";
      emit(AuthErrorState(exception: ServerException(message: message)));
    }on AppExceptions catch(e){
      emit(AuthErrorState(exception: ServerException(message: e.message)));

    }
    catch(e){
      emit(AuthErrorState(exception: ServerException(message: e.toString())));

    }
  }
}
