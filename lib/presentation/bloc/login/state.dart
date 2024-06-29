import 'package:equatable/equatable.dart';

import '../../../core/constants/enums/authStatus.dart';

/// login state
 class LoginState extends Equatable {
  ///
  /// login state
  final Authstatus status;

  /// constructor
  const LoginState({this.status = Authstatus.unAuthenticated});

  @override
  List<Object> get props => [status];

  /// Creates a new instance of [LoginState] with an optional [status] parameter.
  ///
  /// If [status] is not provided, the new instance will have the same [status]
  /// as the current instance.
  ///
  /// Returns a new instance of [LoginState].
  LoginState copyWith({Authstatus? status}) {
    return LoginState(status: status ?? this.status);
  }
}

/// login initial state
class LoginInitial extends LoginState {}

/// login loading state
class LoginLoading extends LoginState {}

/// login success state
class LoginSuccess extends LoginState {}

/// login failure state
class LoginFailure extends LoginState {}
