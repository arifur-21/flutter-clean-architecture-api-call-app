
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/data/data_source/response/response_api.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/data/model_dto/put_user_model/put_user_model.dart';
import '../../../domain/entities/AuthModel.dart';
import '../../model_dto/user_model/user_model_dto.dart';

class PostRemoteDataSource {

  final Dio dio;

  PostRemoteDataSource(this.dio);


  Future<dynamic> createPost(AuthModel user) async {
    try {
      final data = user.toJson();
      final response = await dio
          .post('https://reqres.in/api/login', data: data)
          .timeout(Duration(seconds: 50));
      dynamic jsonResponse = ResponseApiCheck.returnResponse(response);
      return UserModel.fromJson(jsonResponse);
    } catch (e) {
     throw ResponseApiCheck.handleException(e);
    }
  }



Future<dynamic> getMovie()async{
    try{
      final response = await dio.get('https://www.episodate.com/api/most-popular?page=1').timeout(Duration(seconds: 50));
      dynamic jsonResponse = ResponseApiCheck.returnResponse(response);

      return jsonResponse;
    }catch (e){

      throw ResponseApiCheck.handleException(e);
    }
}


  Future<dynamic> updateUser(PutUserModel user) async {
    try {
      final data = user.toJson();
      final response = await dio
          .put('https://reqres.in/api/users/2', data: data)
          .timeout(Duration(seconds: 50));
      dynamic jsonResponse = ResponseApiCheck.returnResponse(response);
      return PutUserModel.fromJson(jsonResponse);
    } catch (e) {
      throw ResponseApiCheck.handleException(e);
    }
  }

}




