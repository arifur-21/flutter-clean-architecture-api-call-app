
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/pages/login/widgets/email_input_widget.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/pages/login/widgets/login_button.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/pages/login/widgets/password_input_widget.dart';

import '../../../main.dart';
import '../../bloc/login_bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  late LoginBloc _loginBloc;

  @override
  void initState() {
 _loginBloc = LoginBloc(createPostUseCase: getIt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: BlocProvider(
        create:(_)=> _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailInputWidget(emailFocusNode: emailFocusNode),
                const SizedBox(height: 20,),
                PasswordInputWidget(passwordFocusNode: passwordFocusNode),
                const SizedBox(height: 20,),

                LoginButtons(formKey: _formKey)
              ],
            ),
          ),
        ),
      ),

    );
  }
}
