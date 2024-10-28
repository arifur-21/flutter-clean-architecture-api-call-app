



import 'package:equatable/equatable.dart';

abstract class PutEvent extends Equatable{
  const PutEvent();

}

class NameChange extends PutEvent{
  final String name;
  const NameChange({required this.name});

  @override

  List<Object?> get props => [name];
}

class NameUnfocous extends PutEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class JobChange extends PutEvent{
  final String job;
  const JobChange({required this.job});

  @override
  List<Object?> get props => [job];
}
class JobUnfocus extends PutEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class UpdateApi extends PutEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}