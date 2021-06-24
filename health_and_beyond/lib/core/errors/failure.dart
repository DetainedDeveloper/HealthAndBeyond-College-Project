abstract class Failure {
  final String message;

  Failure({required this.message});
}

class NetworkFailure extends Failure {
  final String message;

  NetworkFailure({required this.message}) : super(message: message);
}

class LoginFailure extends Failure {
  final String message;

  LoginFailure({required this.message}) : super(message: message);
}

class CacheFailure extends Failure {
  final String message;

  CacheFailure({required this.message}) : super(message: message);
}
