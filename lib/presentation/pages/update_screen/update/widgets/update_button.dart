
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/bloc/put_bloc/pub_state.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/bloc/put_bloc/put_bloc.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/bloc/put_bloc/put_event.dart';

import '../../../../../utils/enums.dart';
import '../../../../../utils/routes/routes_name.dart';


class UpdateButton extends StatelessWidget {
  final formKey;

  const UpdateButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PutBloc, PutState>(
      listenWhen: (current, previous)=> current.postApiState != previous.postApiState,
      listener: (context, state) {
        if (state.postApiState == PostApiState.error) {
          print("error test ${state.message}");
         // FlushbarHelper.flushBarErrorMessage(state.message.toString(), context);

        }
        if (state.postApiState == PostApiState.success) {
          print("success go to home screen");
          Navigator.pushNamed(context, RoutesName.homeScreen);
         // FlushbarHelper.flushBarErrorMessage('Login success', context);
        }

      },
      child: BlocBuilder<PutBloc, PutState>(
        buildWhen: (current, previous)=> current.postApiState != previous.postApiState,
        builder: (context, state) {
          return ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<PutBloc>().add(UpdateApi());
                  print('valid');
                }
              },
              child: state.postApiState == PostApiState.loading ? CircularProgressIndicator() : const Text('update'));
        },
      ),
    );
  }
  //"name": "morpheus",
//  "job": "zion resident"
}
