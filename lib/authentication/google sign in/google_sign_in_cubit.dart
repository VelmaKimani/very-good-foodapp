import 'package:bloc/bloc.dart';
import 'package:foodapp/models/_index.dart';
import 'package:foodapp/services/_index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'google_sign_in_state.dart';
part 'google_sign_in_cubit.freezed.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInCubit({
    required AuthService authService,
  }) : super(const GoogleSignInState.initial()) {
    _authService = authService;
  }

  late AuthService _authService;

  Future<void> signInwithGoogle() async {
    emit(const GoogleSignInState.loading());
    try {
      final result = await _authService.signInWithGoogle();

      if (result != null) {
        emit(GoogleSignInState.loaded(result));
      }
    } catch (e) {
      emit(const GoogleSignInState.error('Google Sign in failed'));

      Logger().e(e.toString());
    }
  }
}
