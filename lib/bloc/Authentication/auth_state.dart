import 'package:dartz/dartz.dart';

abstract class AuthState {}
class AuthStateInit extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthResponseState extends AuthState {
  Either<String, String> response;
  AuthResponseState(this.response);
}
