part of 'get_search_recipe_cubit.dart';

@freezed
class GetSearchRecipeState with _$GetSearchRecipeState {
  const factory GetSearchRecipeState.initial() = _Initial;
  const factory GetSearchRecipeState.loading() = _Loading;
  const factory GetSearchRecipeState.loaded(List<Result> results) = _Loaded;
  const factory GetSearchRecipeState.error(String message) = _Error;
}
