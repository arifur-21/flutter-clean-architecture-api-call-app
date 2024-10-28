import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/data/model_dto/put_user_model/put_user_model.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/domain/entities/UserModel.dart';

import '../../data/model_dto/user_model/user_model_dto.dart';
import '../storage/local_storage.dart';

class Sessioncontroller{

  static final Sessioncontroller _session = Sessioncontroller._internal();

  final LocalStorage localStorage = LocalStorage();
  bool? isLogin;
  UserModel user = UserModel();

  Sessioncontroller._internal(){
    isLogin = false;
  }

  factory Sessioncontroller(){
    return _session;
  }

  Future<void> saveUserInPreference(UserModel user)async{
    localStorage.setValue('token', jsonEncode(user));
    localStorage.setValue('isLogin', 'true');
  }


  Future<void> getUserFromPreference()async{
    try{
      var userData = await localStorage.readValue('token');
      var isLogin = await localStorage.readValue('isLogin');

      if(userData.isNotEmpty){
        Sessioncontroller().user = UserModel.fromJson(jsonDecode(userData));
      }
      Sessioncontroller().isLogin = isLogin == 'true' ? true : false;
    }catch(e){
      debugPrint(e.toString());
    }
  }

}