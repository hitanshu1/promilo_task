import 'package:equatable/equatable.dart';
/// login event
abstract class LoginEvent extends Equatable {
  /// constructor
  const LoginEvent();

  @override
  List<Object> get props => [];
}
///To check if the current user is already logged in or not
class CheckAuthEvent extends LoginEvent {
  @override
  List<Object> get props => [DateTime.now().millisecondsSinceEpoch];
}
/// login button pressed event
class LoginButtonPressed extends LoginEvent {
  /// email 
  final String email;
  /// password
  final String password;
  /// remember me
  final bool rememberMe;
/// constructor
  const LoginButtonPressed({required this.email, required this.password, this.rememberMe = false});

  @override
  List<Object> get props => [email, password];
}
/// logout button pressed event
class LogoutEvent extends LoginEvent {}
