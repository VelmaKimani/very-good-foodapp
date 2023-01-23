part of foodapp_models;

@freezed
class Users with _$Users {
  factory Users({
    String? name,
    String? email,
    String? password,
  }) = _Users;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}
