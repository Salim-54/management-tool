class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() {
    return message;
  }
}


class CustomHttpException implements Exception {
  final String message;

  CustomHttpException(this.message);

  @override
  String toString() {
    return message;
  }
}
