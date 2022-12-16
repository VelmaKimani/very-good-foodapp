part of foodapp_services;

abstract class RecipesService {
  Future<RecipeList> getRandomRecipes();
  Future<RecipeList> getInformationRecipes();
  Future<SearchList> searchRecipe();
  Future<Recipe> getRecipeIngredients({
    required List<ExtendedIngredient> extendedIngredient,
    required String instructions,
  });
}

class RecipesServiceImplementation implements RecipesService {
  final _baseUrl = FoodAppConfig.instance!.values.baseDomain;
  final _allRandomRecipes = FoodAppConfig.instance!.values.randomRecipeUrl;
  final _allInformationRecipe =
      FoodAppConfig.instance!.values.informationRecipe;
  final _searchRecipe = FoodAppConfig.instance!.values.searchRecipe;

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
  Future<SearchList> searchRecipe() async {
    final recipesUrl = '$_baseUrl$_searchRecipe';

    try {
      final resp = await _networkUtil.getReq(
        recipesUrl,
      );

      Logger().i(resp);

      return SearchList.fromJson(resp);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  @override
  Future<Recipe> getRecipeIngredients({
    required List<ExtendedIngredient> extendedIngredient,
    required String instructions,
  }) async {
    final recipesUrl =
        '$_baseUrl$_allRandomRecipes?with[]=recipes.extendedIngredients&with'
        '=instructions';
    try {
      final resp = await _networkUtil.getReq(
        recipesUrl,
      );

      Logger().i(resp);

      return Recipe.fromJson(resp);
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
