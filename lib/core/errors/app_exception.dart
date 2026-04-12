sealed class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const AppException(this.message, {this.stackTrace});

  @override
  String toString() => message;
}

class DatabaseException extends AppException {
  const DatabaseException(String message, {StackTrace? stackTrace})
      : super(message, stackTrace: stackTrace);
}

class ItemNotFoundException extends AppException {
  const ItemNotFoundException(String message, {StackTrace? stackTrace})
      : super(message, stackTrace: stackTrace);
}

class UnknownException extends AppException {
  const UnknownException(String message, {StackTrace? stackTrace})
      : super(message, stackTrace: stackTrace);
}
