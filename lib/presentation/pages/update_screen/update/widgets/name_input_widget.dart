import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/bloc/put_bloc/pub_state.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/bloc/put_bloc/put_event.dart';

import '../../../../bloc/put_bloc/put_bloc.dart';


class NameInputWidget extends StatelessWidget {


  const NameInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<PutBloc, PutState>(
      buildWhen: (current,previous)=> current.name != previous.name,
        builder: (context, state){
      return TextFormField(
        keyboardType: TextInputType.text,

        decoration: const InputDecoration(
            hintText: 'Name',
            border: OutlineInputBorder()
        ),
        onChanged: (value){
          context.read<PutBloc>().add(NameChange(name: value));
        },
        validator: (value){
          if(value!.isEmpty){
            return 'Enter Namel';
          }
          return null;
        },
        onFieldSubmitted: (value){

        },
      );
    });
  }
}
