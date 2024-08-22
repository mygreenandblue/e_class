import 'package:eclass/core/api/api_exception.dart';

class InfoMessageException implements Exception {
  final ErrorCode code;
  final String? message;
  final StackTrace? stackTrace;
  InfoMessageException({
    required this.code,
    this.message,
    this.stackTrace,
  });

  @override
  String toString() {
    return 'InfoMessageException(code: $code, message: $message, stackTrace: $stackTrace)';
  }
}
