import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Connection Timeout with ApiServer");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure("Request to ApiServer was cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure("No Internet Connection");
      case DioExceptionType.unknown:
        return ServerFailure("Unexpected Error, Please try again!");
      default:
        return ServerFailure("Opps there was an error, Please try again");
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found, Please try later");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server error, Please try later");
    } else {
      return ServerFailure("Opps there was an error, Please try again");
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure(super.errMessage);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.errMessage);
}
