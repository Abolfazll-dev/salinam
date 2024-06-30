abstract class AuthEvent {}

class AuthLoginRequest extends AuthEvent {
  String username;
  String password;

  AuthLoginRequest(this.password, this.username);
}

class AuthRegisterRequest extends AuthEvent {
  String username;
  String password;
  String passwordConfirm;
  String name;
  String email;

  AuthRegisterRequest(this.username,this.password, this.passwordConfirm,this.name,this.email);
}
