import 'package:bloc/bloc.dart';

import '../../../core/constants/enums/authStatus.dart';
import '../../../core/utils/crypto.dart';
import '../../../core/utils/getStorage.dart';
import '../../../domain/repositories/auth.dart';
import '../appUser/bloc.dart';
import 'event.dart';
import 'state.dart';

/// login bloc manange state and event
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  /// login repository
  final AuthRepository repository;

  /// login bloc constructor
  LoginBloc(this.repository) : super(LoginInitial()) {
    on<CheckAuthEvent>(_checkAuthFn);
    on<LoginButtonPressed>(_onLogin);
    on<LogoutEvent>(_logoutFn);
  }

  Future<void> _checkAuthFn(
      CheckAuthEvent event, Emitter<LoginState> emit) async {
    final AppUser user = AppGetXStorage.getUser;
    final Authstatus status = user == AppUser.notFound
        ? Authstatus.unAuthenticated
        : Authstatus.authenticated;
    emit(state.copyWith(status: status));
  }

  Future<void> _onLogin(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final response = await repository.login(
        event.email, CryptoService.generateSHA256Hash(event.password));

    print(response.responseString);
    if (response.isSuccess) {
      if (event.rememberMe) {
        final AppUser appUser = AppUser.fromJson(response.json['response']);

        AppGetXStorage.setUserProfile(appUser);
      }
      emit(LoginSuccess());
      emit(state.copyWith(status: Authstatus.authenticated));
    } else {
      emit(LoginFailure());
    }
  }

  Future<void> _logoutFn(LogoutEvent event, Emitter<LoginState> emit) async {
    AppGetXStorage.logout();
    emit(LoginInitial());
    emit(state.copyWith(status: Authstatus.unAuthenticated));
  }
}
