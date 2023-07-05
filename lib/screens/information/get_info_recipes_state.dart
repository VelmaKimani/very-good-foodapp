part of 'get_info_recipes_cubit.dart';

@freezed
class GetInfoRecipesState with _$GetInfoRecipesState {
  const factory GetInfoRecipesState.initial() = _Initial;
  const factory GetInfoRecipesState.loading() = _Loading;
  const factory GetInfoRecipesState.loaded(
    RecipeInformation recipeInformation,
  ) = _Loaded;
  const factory GetInfoRecipesState.error(String message) = _Error;
}
