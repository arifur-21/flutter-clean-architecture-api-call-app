import 'package:flutter_final_clean_archi_bloc_api_app/data/model_dto/put_user_model/put_user_model.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/data/model_dto/user_model/user_model_dto.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/domain/entities/UserModel.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/domain/repository/user_repository.dart';

import '../../data/model_dto/movie_model/movie_model.dart';
import '../entities/AuthModel.dart';

class CreatePostUseCase{
  final UserRepository repository;

  CreatePostUseCase(this.repository);

  Future<UserModel> call(AuthModel user)async{
    final response =  await repository.loginApi(user);
    return response;
  }

  Future<MovieModel> featchMovie(){
    return repository.getMovie();
  }

  Future<PutUserModel> updateUser(PutUserModel user)async{
    final response =  await repository.UpdateUser(user);
    return response;
  }
}