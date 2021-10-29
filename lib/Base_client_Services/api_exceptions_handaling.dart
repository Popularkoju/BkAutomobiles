class AppException implements Exception {
  final String? message;
  final String? Prefix;
  final String? url;

  AppException([this.message, this.Prefix, this.url]);
}

class BadRequestException extends AppException {
  BadRequestException(String message, String url)
      : super(message, 'Bad Request', url);
}

class FetchDataException extends AppException {
  FetchDataException(String message, String url)
      : super(message, 'Unable to process data', url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException(String message, String url)
      : super(message, 'Api not responds', url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException(String message, String url)
      : super(message, 'unauthorized access', url);
}

// class BadRequestException extends AppException{
//   BadRequestException(String message, String url): super(message, 'Bad Request', url);
// }