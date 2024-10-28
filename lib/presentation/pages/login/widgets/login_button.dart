
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/enums.dart';
import '../../../../utils/routes/routes_name.dart';
import '../../../bloc/login_bloc/login_bloc.dart';

class LoginButtons extends StatelessWidget {
  final formKey;

  const LoginButtons({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (current, previous)=> current.postApiState != previous.postApiState,
      listener: (context, state) {
        if (state.postApiState == PostApiState.error) {
         // FlushbarHelper.flushBarErrorMessage(state.message.toString(), context);
        }
        if (state.postApiState == PostApiState.success) {
          print("success go to home screen");
          Navigator.pushNamed(context, RoutesName.homeScreen);
         // FlushbarHelper.flushBarErrorMessage('Login success', context);
        }

      },
      child: BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (current, previous)=> current.postApiState != previous.postApiState,
        builder: (context, state) {
          return ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(LoginApi());
                }
              },
              child: state.postApiState == PostApiState.loading ? CircularProgressIndicator() : const Text('Login'));
        },
      ),
    );
  }
}
