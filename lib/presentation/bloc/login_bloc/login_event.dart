
part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable{
 const LoginEvent();

}

class EmailChange extends LoginEvent{
  final String email;
  const EmailChange({required this.email});

  @override

  List<Object?> get props => [email];
}

class EmailUnfocous extends LoginEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class PasswordChange extends LoginEvent{
  final String password;
  const PasswordChange({required this.password});

  @override
  List<Object?> get props => [password];
}
class PasswordUnfocus extends LoginEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoginApi extends LoginEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}