part of 'firebase_sign_up_cubit.dart';

@freezed
class FirebaseSignUpState with _$FirebaseSignUpState {
  const factory FirebaseSignUpState.initial() = _Initial;
  const factory FirebaseSignUpState.loading() = _Loading;
  const factory FirebaseSignUpState.loaded() = _Loaded;
  const factory FirebaseSignUpState.error(String error) = _Error;
}
