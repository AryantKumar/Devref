sealed class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const AppException(this.message, {this.stackTrace});

  @override
  String toString() => message;
}

class DatabaseException extends AppException {
  const DatabaseException(super.message, {super.stackTrace});
}

class ItemNotFoundException extends AppException {
  const ItemNotFoundException(super.message, {super.stackTrace});
}

class UnknownException extends AppException {
  const UnknownException(super.message, {super.stackTrace});
}
