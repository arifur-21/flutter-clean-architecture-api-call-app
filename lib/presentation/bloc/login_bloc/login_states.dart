part of 'login_bloc.dart';

class LoginStates extends Equatable{
  final String email;
  final String password;
  final String message;
  final PostApiState postApiState;
  const LoginStates({this.email = '', this.password = '',this.message = '', this.postApiState = PostApiState.initial});

  LoginStates copyWith({
    String? email,
    String? password,
    String? message,
    PostApiState? postApiState,
}){
    return LoginStates(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      postApiState: postApiState ?? this.postApiState
    );
  }

  @override
  List<Object?> get props => [email,password,message,postApiState];
}