
import 'package:flutter_final_clean_archi_bloc_api_app/data/model_dto/put_user_model/put_user_model.dart';

import '../../data/model_dto/movie_model/movie_model.dart';
import '../../data/model_dto/user_model/user_model_dto.dart';
import '../entities/AuthModel.dart';

abstract class UserRepository{

  Future<UserModel> loginApi(AuthModel user);

  Future<MovieModel> getMovie();

  Future<PutUserModel> UpdateUser(PutUserModel user);
}