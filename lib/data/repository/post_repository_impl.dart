
import 'package:flutter_final_clean_archi_bloc_api_app/data/data_source/remote/post_remote_data_source.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/data/model_dto/movie_model/movie_model.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/data/model_dto/put_user_model/put_user_model.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/domain/repository/user_repository.dart';

import '../../domain/entities/AuthModel.dart';
import '../model_dto/user_model/user_model_dto.dart';

class PostRepositoryImpl implements UserRepository{

  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserModel> loginApi(AuthModel user)async {
    final response = await remoteDataSource.createPost(user);
    return response;
    }

  @override
  Future<MovieModel> getMovie() async{
    final response = await remoteDataSource.getMovie();
   return MovieModel.fromJson(response);
  }

  @override
  Future<PutUserModel> UpdateUser(PutUserModel user) async{
    final response = await remoteDataSource.updateUser(user);
    return response;
  }




}