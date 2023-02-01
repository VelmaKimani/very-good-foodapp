import 'package:bloc/bloc.dart';
import 'package:foodapp/models/_index.dart';
import 'package:foodapp/services/_index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({
    required AuthService authService,
  }) : super(SignupState.initial()) {
    _authService = authService;
  }

  late AuthService _authService;

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const SignupState.loading());
    try {
      final result = await _authService.signUp(
        name: name,
        email: email,
        password: password,
      );
      Logger().i(result);

      emit(SignupState.loaded(result));
    } on Failure catch (e) {
      emit(SignupState.error(e.message));
    } catch (e) {
      Logger().e(e.toString());
      emit(const SignupState.error('Failed to sign up'));
    }
  }
}
