import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shopio_app/api/api_services.dart';
import 'package:shopio_app/api/dio/dio_interceptor.dart';
import 'package:shopio_app/api/end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModule {
  @singleton
  BaseOptions get baseOption => BaseOptions(
    baseUrl: EndPoints.baseUrl,
    receiveTimeout: Duration(seconds: 5),
    sendTimeout: Duration(seconds: 5),
  );

  @singleton
  PrettyDioLogger get prettyDioLogger => PrettyDioLogger(
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    request: true,
  );

  @singleton
  Dio provideDio(BaseOptions baseOption, PrettyDioLogger prettyDioLogger) {
    var dio = Dio(baseOption);
    dio.interceptors.add(DioInterceptor());
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @singleton
  ApiServices get apiServices =>
      ApiServices(provideDio(baseOption, prettyDioLogger));
}

//todo: apiServices => dio object
//todo: dio => BaseOptions , PrettyDioLogger , Interceptor
