part of foodapp_models;

@freezed
abstract class SearchList with _$SearchList {
  factory SearchList(
    List<Result> results,
    int? offset,
    int? number,
    int? totalResults,
  ) = _SearchList;

  factory SearchList.fromJson(Map<String, dynamic> json) =>
      _$SearchListFromJson(json);
}

@freezed
abstract class Result with _$Result {
  factory Result(
    int? id,
    String? title,
    String? image,
    String? imageType,
  ) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
