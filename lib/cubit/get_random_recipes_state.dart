part of 'get_random_recipes_cubit.dart';

@freezed
class GetRandomRecipesState with _$GetRandomRecipesState {
  const factory GetRandomRecipesState.initial() = _Initial;
  const factory GetRandomRecipesState.loading() = _Loading;
  const factory GetRandomRecipesState.loaded(Recipe recipe) = _Loaded;
  const factory GetRandomRecipesState.error(String message) = _Error;
}
