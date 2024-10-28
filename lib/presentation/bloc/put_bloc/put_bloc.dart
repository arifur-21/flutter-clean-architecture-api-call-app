import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/data/model_dto/put_user_model/put_user_model.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/domain/entities/AuthModel.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/domain/use_case/create_post_use_case.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/bloc/put_bloc/pub_state.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/presentation/bloc/put_bloc/put_event.dart';

import '../../../utils/enums.dart';



class PutBloc extends Bloc<PutEvent, PutState> {
  CreatePostUseCase createPostUseCase;

  PutBloc({required this.createPostUseCase}) : super(const PutState()) {
    on<NameChange>(_onEmailChange);
    on<JobChange>(_onPasswordChange);
    on<UpdateApi>(_updateApi);
  }

  void _onEmailChange(NameChange event, Emitter<PutState> emit) {
    emit(state.copyWith(email: event.name));
  }

  void _onPasswordChange(JobChange event, Emitter<PutState> emit) {
    emit(state.copyWith(password: event.job));
  }

  void _updateApi(UpdateApi event, Emitter<PutState> emit) async {
    print("update bloc");


    PutUserModel authModel = PutUserModel(name: state.name , job: state.job);

    emit(state.copyWith(postApiState: PostApiState.loading));

    await createPostUseCase.updateUser(authModel).then((value) async {
      if (value.job.isNotEmpty) {
        emit(state.copyWith(
            message: value.job.toString(), postApiState: PostApiState.error));
      }
      if (value.name.isNotEmpty) {
        emit(state.copyWith(
            message: 'update successfull', postApiState: PostApiState.success));
      }
    }).onError((error, stactTrace) {
      emit(state.copyWith(
          message: error.toString(), postApiState: PostApiState.error));
    });
//eve.holt@reqres.in
    //cityslicka
  }
}


