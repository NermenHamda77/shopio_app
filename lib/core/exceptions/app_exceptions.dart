abstract class AppExceptions implements Exception{
  String message;
  int? statusCode;
  AppExceptions({required this.statusCode , required this.message});
}

class ServerException extends AppExceptions{
  ServerException({ super.statusCode, required super.message});
}


class NetworkException extends AppExceptions{
  NetworkException({ super.statusCode, required super.message});
}


class UnexpectedException extends AppExceptions{
  UnexpectedException({ super.statusCode, required super.message});
}