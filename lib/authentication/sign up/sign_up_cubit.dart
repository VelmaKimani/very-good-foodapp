import 'package:bloc/bloc.dart';
import 'package:foodapp/models/_index.dart';
import 'package:foodapp/services/_index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required AuthService authService,
  }) : super(const SignUpState.initial()) {
    _authService = authService;
  }
  late AuthService _authService;

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const SignUpState.loading());
    try {
      final result = await _authService.signUp(
        users: Users(
          name: name,
          email: email,
          password: password,
        ),
      );
      Logger().i(result);

      emit(const SignUpState.loaded());
    } on Failure catch (e) {
      emit(SignUpState.error(e.message));
    } catch (e) {
      Logger().e(e.toString());
      emit(const SignUpState.error('Failed to post user'));
    }
  }
}
