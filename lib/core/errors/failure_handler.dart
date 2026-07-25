import 'package:dio/dio.dart';

String getErrorMessage(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return "Connection timed out.";

    case DioExceptionType.receiveTimeout:
      return "Server took too long to respond.";

    case DioExceptionType.sendTimeout:
      return "Request timed out.";

    case DioExceptionType.connectionError:
      return "No internet connection.";

    case DioExceptionType.badResponse:
      return "Server error.";

    case DioExceptionType.cancel:
      return "Request was cancelled.";

    default:
      return "Something went wrong.";
  }
}