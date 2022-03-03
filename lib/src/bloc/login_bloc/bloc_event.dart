import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends LoginEvent {}

// Dùng để check sự kiện xem ô username có để trống hay không
class LoginUsernameChanged extends LoginEvent {
  final String username;
  LoginUsernameChanged({required this.username});
}

// Dùng để check sự kiện xem ô password có để trống hay không
class LoginPasswordChanged extends LoginEvent {
  final String password;
  LoginPasswordChanged({required this.password});
}

// Sự kiện nhấn nút login
class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;
  LoginSubmitted({required this.email, required this.password});

  List<Object> get prop => [email, password];
}
