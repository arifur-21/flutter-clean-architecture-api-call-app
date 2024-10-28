

import 'package:flutter/material.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/config/splash_service/splash_services.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices _splashServices = SplashServices();
  @override
  void initState() {
_splashServices.isLogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Screen"),
      ),

      body: SafeArea(
        child: Center(
          child: Column(
            children: [

           /*   LoadingWidget(),
              RoundeButton(title : "login" ,onPress: () {

              },),
              InternetException(),
              TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, RoutesName.homeScreen);
                },
                child: const Text("Go to home Screen"),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
