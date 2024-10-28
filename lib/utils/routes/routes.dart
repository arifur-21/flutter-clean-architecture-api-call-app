

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/utils/routes/routes_name.dart';

import '../../presentation/pages/home/home_screen.dart';
import '../../presentation/pages/login/login_screen.dart';
import '../../presentation/pages/splash/splash_screen.dart';
import '../../presentation/pages/update_screen/update/update_screen.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context)=>SplashScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context)=>HomeScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context)=>LoginScreen());
      case RoutesName.updateScreen:
        return MaterialPageRoute(builder: (context)=>UpdateScreen());
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Center(
              child: Text("no Route generated"),
            ),
          );
        });
    }
  }
 }