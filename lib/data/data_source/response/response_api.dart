import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../config/exceptions/app_exceptions.dart';

class ResponseApiCheck{


 static dynamic handleException(dynamic exception) {
    if (exception is DioException) {
      throw ResponseApiCheck.dioException(exception);
    } else if (exception is SocketException) {
      throw NoInternetException('No Internet');
    } else if (exception is TimeoutException) {
      throw TimeoutException('Time out, please try again');
    } else {
      throw FetchDataException('Unexpected error: $exception');
    }
  }



 static FetchDataException dioException(DioException e){
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          throw BadRequestException(e.response!.data['error'] ?? 'User not found');
        case 401:
          throw UnAuthorisedException();
        case 500:
          throw FetchDataException("Server error: ${e.response!.statusCode}");
        default:
          throw FetchDataException("Unexpected error: ${e.response!.statusCode}");
      }
    } else {

      throw FetchDataException('Unexpected error: ${e.message}');
    }
  }

 static dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data is String
            ? jsonDecode(response.data)
            : response.data;
      default:
        throw FetchDataException("Unexpected error: ${response.statusCode}");
    }
  }

}
