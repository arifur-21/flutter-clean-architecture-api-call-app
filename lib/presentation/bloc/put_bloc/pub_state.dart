



import 'package:equatable/equatable.dart';

import '../../../utils/enums.dart';

class PutState extends Equatable{
  final String name;
  final String job;
  final String message;
  final PostApiState postApiState;
  const PutState({this.name = '', this.job = '',this.message = '', this.postApiState = PostApiState.initial});

  PutState copyWith({
    String? email,
    String? password,
    String? message,
    PostApiState? postApiState,
  }){
    return PutState(
        name: email ?? this.name,
        job: password ?? this.job,
        message: message ?? this.message,
        postApiState: postApiState ?? this.postApiState
    );
  }

  @override
  List<Object?> get props => [name,job,message,postApiState];
}