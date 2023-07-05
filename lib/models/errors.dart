part of '_index.dart';

@freezed
class FoodAppValidationError with _$FoodAppValidationError {
  factory FoodAppValidationError(
    int code,
    List<FoodAppFieldValidationError> errors,
  ) = _FoodAppValidationError;

  factory FoodAppValidationError.fromJson(Map<String, dynamic> json) =>
      _$FoodAppValidationErrorFromJson(json);
}

@freezed
class FoodAppFieldValidationError with _$FoodAppFieldValidationError {
  factory FoodAppFieldValidationError(
    String key,
    List<String> errors,
  ) = _FoodAppFieldValidationError;

  factory FoodAppFieldValidationError.fromJson(Map<String, dynamic> json) =>
      _$FoodAppFieldValidationErrorFromJson(json);
}

class Failure implements Exception {
  Failure({
    required this.message,
    this.errors = const [],
  });

  final String message;
  List<FoodAppFieldValidationError> errors;

  List<String> errorMessages() {
    final messageErrors = <String>[];

    for (final messageError in errors) {
      messageErrors.add(
        messageError.errors[0],
      );
    }

    return List.castFrom<dynamic, String>(messageErrors);
  }
}
