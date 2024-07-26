class ApiException implements Exception {
  final ErrorCode code;
  final String? details;
  final StackTrace? stackTrace;
  final int? httpStatusCode;

  const ApiException(
    this.code, {
    this.details,
    this.stackTrace,
    this.httpStatusCode,
  });

  const ApiException.unknown({
    String? details,
    StackTrace? stackTrace,
    int? httpStatusCode,
  }) : this(
          ErrorCode.unknown,
          details: details,
          stackTrace: stackTrace,
          httpStatusCode: httpStatusCode,
        );

  @override
  String toString() {
    return "ServerException(code: $code${stackTrace != null ? ', stackTrace: ${stackTrace.toString()}' : ''}${httpStatusCode != null ? ', httpStatusCode: $httpStatusCode' : ''})";
  }
}

enum ErrorCode {
  unknown,
  authenticationFailed,
  notAuthenticated,
  loadUserFail,
}
