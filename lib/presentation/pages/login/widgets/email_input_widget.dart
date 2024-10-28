import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login_bloc/login_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  final emailFocusNode;

  const EmailInputWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (current,previous)=> current.email != previous.email,
        builder: (context, state){
      return TextFormField(
        keyboardType: TextInputType.emailAddress,
        focusNode: emailFocusNode,
        decoration: const InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder()
        ),
        onChanged: (value){
          context.read<LoginBloc>().add(EmailChange(email: value));
        },
        validator: (value){
          if(value!.isEmpty){
            return 'Enter Email';
          }
          return null;
        },
        onFieldSubmitted: (value){

        },
      );
    });
  }
}
