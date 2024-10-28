import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/domain/entities/AuthModel.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/domain/use_case/create_post_use_case.dart';

import '../../../config/sessing_manager/sessionController.dart';
import '../../../utils/enums.dart';

part 'login_event.dart';

part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {
  CreatePostUseCase createPostUseCase;

  LoginBloc({required this.createPostUseCase}) : super(const LoginStates()) {
    on<EmailChange>(_onEmailChange);
    on<PasswordChange>(_onPasswordChange);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChange(EmailChange event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChange(PasswordChange event, Emitter<LoginStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginStates> emit) async {
    AuthModel authModel =
        AuthModel(email: state.email, password: state.password);

    emit(state.copyWith(postApiState: PostApiState.loading));

    await createPostUseCase.call(authModel).then((value) async {
      if (value.error.isEmpty) {
        emit(state.copyWith(
            message: value.error.toString(), postApiState: PostApiState.error));
      }
      else{
        await Sessioncontroller().saveUserInPreference(value);
        emit(state.copyWith(
            message: 'Login successfull', postApiState: PostApiState.success));
      }
    }).onError((error, stactTrace) {
      emit(state.copyWith(
          message: error.toString(), postApiState: PostApiState.error));
    });
//eve.holt@reqres.in
    //cityslicka
  }
}
