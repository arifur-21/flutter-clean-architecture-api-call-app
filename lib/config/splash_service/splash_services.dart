import 'dart:async';
import 'package:flutter/cupertino.dart';

import '../../utils/routes/routes_name.dart';
import '../sessing_manager/sessionController.dart';

class SplashServices{

  void isLogin(BuildContext context){
    //Timer(const Duration(seconds: 3), ()=> Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeScreen, (route)=> false));
    Sessioncontroller().getUserFromPreference().then((value){
      if(Sessioncontroller().isLogin ?? false){
        Timer(const Duration(seconds: 3), ()=> Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeScreen, (route)=> false));
      }else{
        Timer(const Duration(seconds: 3), ()=> Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route)=> false));
      }
    }).onError((error, stackTrace){
      Timer(const Duration(seconds: 3), ()=> Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route)=> false));
    });

  }
}