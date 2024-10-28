import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/data/model_dto/movie_model/movie_model.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/domain/use_case/create_post_use_case.dart';


import '../../../data/response_status/api_response.dart';




part 'movies_state.dart';
part 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState>{

  CreatePostUseCase moviesrepository;

  MoviesBloc({required this.moviesrepository}): super(MoviesState(movieList: ApiResponse.loading())){
    on<MoviesFetched>(featchMoviesListApi);

  }

Future<void> featchMoviesListApi(MoviesFetched event, Emitter<MoviesState> emit)async{

    await moviesrepository.featchMovie().then((value){
      emit(state.copyWith(movieList: ApiResponse.complited(value)));
    }).onError((error, stackTrace){
      emit(state.copyWith(movieList: ApiResponse.error(error.toString())));
    });
}

}