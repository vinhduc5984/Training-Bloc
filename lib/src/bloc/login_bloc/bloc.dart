import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen_bloc/src/bloc/login_bloc/bloc_event.dart';
import 'package:login_screen_bloc/src/bloc/login_bloc/bloc_state.dart';

import 'package:login_screen_bloc/src/common/share_prefernce_user.dart';
import 'package:login_screen_bloc/src/repositories/auth_repository.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final AuthRepository authRepository;
//   final String email;
//   final String password;
//   LoginBloc(this.authRepository, this.email, this.password)
//       : super(LoginState()) {
//     on<LoginEvent>(_onEvent);
//   }

// @override
// Stream<LoginState> mapEventToState(LoginEvent event) async* {
//   if (event is LoginUsernameChanged) {
//     yield state.copyWith(username: event.username);
//   } else if (event is LoginPasswordChanged) {
//     yield state.copyWith(password: event.password);
//   } else if (event is LoginSubmitted) {
//     yield state.copyWith(formStatus: FormSubmitting());

//     try {
//       yield state.copyWith(formStatus: SubmissionSuccess());
//     } catch (e) {
//       yield state.copyWith(formStatus: SubmissionFailed(Exception(e)));
//     }
//   }
// }

// Future<void> _onEvent(LoginEvent event, Emitter<LoginState> emit) async {
//   if (event is LoginUsernameChanged) {
//     emit(state.copyWith(username: event.username));
//   }
//   // password update
//   else if (event is LoginPasswordChanged) {
//     emit(state.copyWith(password: event.password));
//   }
//   //form submitted
//   else if (event is LoginSubmitted) {
//     //emit(state.copyWith(formStatus: FormSubmitting()));
//     // print("$email $password");
//     print(event.username);
//     print(event.password);
//     // try {
//     //   await AuthRepository().loginAPI(email: email, password: password);
//     //   emit(state.copyWith(formStatus: SubmissionSuccess()));
//     // } catch (e) {
//     //   emit(state.copyWith(formStatus: SubmissionFailed(Exception(e))));
//     // }
//   }
// }
//}

class LoginBloc extends Bloc<LoginEvent, LoginState2> {
  final AuthRepository authRepository;
  LoginBloc(LoginState2 initialState, this.authRepository)
      : super(initialState);

  @override
  Stream<LoginState2> mapEventToState(LoginEvent event) async* {
    if (event is StartEvent) {
      yield LoginInitState();
    } else if (event is LoginSubmitted) {
      yield LoginLoadingState();
      var data = await authRepository.loginAPI(
          email: event.email, password: event.password);
      print(event.email + event.password);
      if (data == "Login fail") {
        yield LoginErrorState(message: "Sai email hoặc password");
      } else if (data['status'] == 200) {
        UserSharedPreference.setAccessToken(data['data']['accessToken']);
        print(UserSharedPreference.getAccessToken());
        yield UserLoginSuccessState();
      }
    }
  }
}
