
class AppExceptions implements Exception{

  final _message;
  final _prefix;
  AppExceptions([this._message, this._prefix]);


  @override
  String toString(){
    return '$_message$_prefix';
  }
}


class NoInternetException extends AppExceptions{
  NoInternetException([String? message]): super(message,'No Internet');

}

class UnAuthorisedException extends AppExceptions{
  UnAuthorisedException([String? message]): super(message,'UnAuthorized Exceptions');

}


class FetchDataException implements Exception {
  final String message;
  FetchDataException(this.message);
  String toString() => "FetchDataException: $message";
}

class BadRequestException implements Exception {
  final String message;

  BadRequestException(this.message);

  @override
  String toString() => "BadRequestException: $message";
}

