part of '_index.dart';

abstract class RecipesService {
  Future<RecipeList> getRandomRecipes();
  Future<RecipeInformation> getInformationRecipes();
  Future<SearchList> getsearchRecipe({
    required String name,
  });
}

class RecipesServiceImplementation implements RecipesService {
  final _baseUrl = FoodAppConfig.instance!.values.baseDomain;
  final _allRandomRecipes = FoodAppConfig.instance!.values.randomRecipeUrl;
  final _searchRecipe = FoodAppConfig.instance!.values.searchRecipe;
  final _allInformationRecipe =
      FoodAppConfig.instance!.values.informationRecipe;

  @override
  Future<RecipeList> getRandomRecipes() async {
    final recipesUrl = '$_baseUrl$_allRandomRecipes';

    try {
      final resp = await _networkUtil.getReq(
        recipesUrl,
      );

      Logger().i(resp);

      return RecipeList.fromJson(resp);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  @override
  Future<SearchList> getsearchRecipe({
    required String name,
  }) async {
    try {
      final searchRecipesUrl = '$_baseUrl$_searchRecipe';
      final resp = await _networkUtil.getReq(
        '$searchRecipesUrl$name',
      );

      Logger().i(resp);

      return SearchList.fromJson(resp);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  @override
  Future<RecipeInformation> getInformationRecipes() async {
    final recipesUrl = '$_baseUrl$_allInformationRecipe';

    try {
      final resp = await _networkUtil.getReq(
        recipesUrl,
      );

      Logger().i(resp);

      return RecipeInformation.fromJson(resp);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }
}
