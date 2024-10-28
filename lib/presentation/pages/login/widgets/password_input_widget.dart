import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login_bloc/login_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  final passwordFocusNode;
  const PasswordInputWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (current, previous) => current.password != previous.password,
        builder: (context, state){
      return TextFormField(
        keyboardType: TextInputType.text,
        focusNode: passwordFocusNode,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Password', border: OutlineInputBorder()
        ),
        onChanged: (value){
          context.read<LoginBloc>().add(PasswordChange(password: value));
        },
        validator: (value){
          if(value!.isEmpty){
            return 'Enter Password';
          }
          return null;
        },
        onFieldSubmitted: (value){

        },
      );
    });
  }
}
