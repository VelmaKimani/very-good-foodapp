import 'package:bloc/bloc.dart';
import 'package:foodapp/services/_index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required AuthService authService,
  }) : super(LoginState.initial()) {
    _authService = authService;
  }

  late AuthService _authService;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const LoginState.loading());
    try {
      final result = await _authService.login(
        email: email,
        password: password,
      );

      Logger().i(result);

      emit(LoginState.loaded());
    } catch (e) {
      emit(const LoginState.error('Log in failed'));

      Logger().e(e.toString());
    }
  }
}
