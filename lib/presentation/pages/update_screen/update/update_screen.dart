
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/bloc/put_bloc/put_bloc.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/pages/update_screen/update/widgets/job_input_widget.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/pages/update_screen/update/widgets/name_input_widget.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/pages/update_screen/update/widgets/update_button.dart';

import '../../../../main.dart';


class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {

  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  late PutBloc _loginBloc;

  @override
  void initState() {
 _loginBloc = PutBloc(createPostUseCase: getIt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("update"),
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
                NameInputWidget(),
                const SizedBox(height: 20,),
                JobInputWidget(),
                const SizedBox(height: 20,),

                UpdateButton(formKey: _formKey)
              ],
            ),
          ),
        ),
      ),

    );
  }
}
