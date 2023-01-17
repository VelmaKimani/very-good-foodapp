part of foodapp_services;

abstract class RecipesService {
  Future<RecipeList> getRandomRecipes();
  Future<RecipeList> getInformationRecipes();
  Future<SearchList> getsearchRecipe({
    required String name,
  });
}

class RecipesServiceImplementation implements RecipesService {
  final _baseUrl = FoodAppConfig.instance!.values.baseDomain;
  final _allRandomRecipes = FoodAppConfig.instance!.values.randomRecipeUrl;
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
      final searchRecipesUrl = '$_baseUrl/complexSearch';
      final resp = await _networkUtil.getReq(
        '$searchRecipesUrl?with[]=cuisine&with[]=query&name=$name',
      );

      Logger().i(resp);

      return SearchList.fromJson(resp);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  @override
  Future<RecipeList> getInformationRecipes() async {
    final recipesUrl = '$_baseUrl$_allInformationRecipe';

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
}
