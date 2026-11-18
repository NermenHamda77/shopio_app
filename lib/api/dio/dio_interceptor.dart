import 'package:dio/dio.dart';
import 'package:shopio_app/core/exceptions/app_exceptions.dart';

class DioInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppExceptions exception;
    String message = "Something went wrong";
    final responseData = err.response?.data;
    if (responseData is Map) {
      message =
          responseData["errors"]?["msg"] ?? responseData["message"] ?? message;
    }
    switch (err.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        exception = NetworkException(
          message: "Please check internet connection",
          statusCode: err.response?.statusCode,
        );
        break;

      case DioExceptionType.badResponse:
        exception = ServerException(
          message: message,
          statusCode: err.response?.statusCode,
        );
        break;
      case DioExceptionType.cancel:
        exception = UnexpectedException(
          message: "Request was cancelled",
          statusCode: err.response?.statusCode,
        );
        break;
      default:
        exception = UnexpectedException(
          message: message,
          statusCode: err.response?.statusCode,
        );
    }
    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        error: exception,
        type: err.type,
        response: err.response
      )
    );
  }
}
