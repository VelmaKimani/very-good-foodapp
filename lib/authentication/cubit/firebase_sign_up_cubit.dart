import 'package:bloc/bloc.dart';
import 'package:foodapp/models/_index.dart';
import 'package:foodapp/services/_index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'firebase_sign_up_state.dart';
part 'firebase_sign_up_cubit.freezed.dart';

class FirebaseSignUpCubit extends Cubit<FirebaseSignUpState> {
  FirebaseSignUpCubit({
    required AuthService authService,
  }) : super(const FirebaseSignUpState.initial()) {
    _authService = authService;
  }
  late AuthService _authService;

  Future<void> firebaseSignUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const FirebaseSignUpState.loading());
    try {
      final result = await _authService.firebaseSignUp(
          users: Users(
        name: name,
        email: email,
        password: password,
      ));
      Logger().i(result);

      emit(FirebaseSignUpState.loaded());
    } on Failure catch (e) {
      emit(FirebaseSignUpState.error(e.message));
    } catch (e) {
      Logger().e(e.toString());
      emit(const FirebaseSignUpState.error('Failed to post user'));
    }
  }
}
