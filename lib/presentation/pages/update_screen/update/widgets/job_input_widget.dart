import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/bloc/put_bloc/pub_state.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/bloc/put_bloc/put_bloc.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/bloc/put_bloc/put_event.dart';



class JobInputWidget extends StatelessWidget {

  const JobInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PutBloc, PutState>(
      buildWhen: (current, previous) => current.job != previous.job,
        builder: (context, state){
      return TextFormField(
        keyboardType: TextInputType.text,

        decoration: const InputDecoration(
            hintText: 'Job', border: OutlineInputBorder()
        ),
        onChanged: (value){
          context.read<PutBloc>().add(JobChange(job: value));
        },
        validator: (value){
          if(value!.isEmpty){
            return 'Enter Job';
          }
          return null;
        },
        onFieldSubmitted: (value){

        },
      );
    });
  }
}
