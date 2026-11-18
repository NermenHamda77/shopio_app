import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopio_app/core/exceptions/app_exceptions.dart';
import 'package:shopio_app/domain/entities/auth/request/sign_in/sign_in_request.dart';
import 'package:shopio_app/domain/use_case/auth/login_use_case.dart';
import 'package:shopio_app/features/ui/auth/auth_states.dart';

@injectable
class SignInViewModel extends Cubit<AuthStates>{
  final LoginUseCase _signInUseCase;
  SignInViewModel( this._signInUseCase):super(AuthLoadingState());
  Future<void> signIn({required String email , required String password}) async {
    try{
      emit(AuthLoadingState());
      SignInRequest signInRequest = SignInRequest(
          email: email,
          password: password
      );
      var response = await _signInUseCase.invoke(signInRequest);
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
