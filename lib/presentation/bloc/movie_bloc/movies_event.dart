part of 'movies_bloc.dart';
abstract class MoviesEvent extends Equatable{

  const MoviesEvent();
  @override
  List<Object> get props =>[];

}

class MoviesFetched extends MoviesEvent{

  @override
  List<Object> get props =>[];
}


