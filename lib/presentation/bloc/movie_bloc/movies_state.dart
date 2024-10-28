part of 'movies_bloc.dart';



class MoviesState extends Equatable {
  final ApiResponse<MovieModel> movieList;

  const MoviesState({
    required this.movieList
  });

  MoviesState copyWith({
    ApiResponse<MovieModel>? movieList
  }) {
    return MoviesState(movieList: movieList ?? this.movieList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [movieList];

}


