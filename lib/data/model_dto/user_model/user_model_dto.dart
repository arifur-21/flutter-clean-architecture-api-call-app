import 'package:flutter_final_clean_archi_bloc_api_app/domain/entities/UserModel.dart';

class UserModel extends User {
  UserModel({
       String? token,
        String? error
  }) : super(token: token = '' , error: error = '' );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        token: json['token'] ?? '',
        error: json['error'] ?? '');
  }

  User toDomain(){
    return User(token: token, error: error);
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'error': error};
  }
}



