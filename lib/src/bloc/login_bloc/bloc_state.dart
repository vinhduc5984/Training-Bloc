import 'package:equatable/equatable.dart';
import 'package:login_screen_bloc/src/bloc/login_bloc/form_submission_status.dart';

class LoginState {
  final String username;
  bool get isValidUsername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  LoginState({
    this.username = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

class LoginState2 extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitState extends LoginState2 {}

class LoginLoadingState extends LoginState2 {}

class UserLoginSuccessState extends LoginState2 {}

class LoginErrorState extends LoginState2 {
  final String message;
  LoginErrorState({required this.message});
}
