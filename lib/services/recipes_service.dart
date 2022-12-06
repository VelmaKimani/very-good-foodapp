part of foodapp_services;

abstract class RecipesService {
  Future<Recipe> getRandomRecipes();
  Future<RecipeList> getInformationRecipes();
}

class RecipesServiceImplementation implements RecipesService {
  final _baseUrl = FoodAppConfig.instance!.values.baseDomain;

  @override
  Future<Recipe> getRandomRecipes() async {
    final recipesUrl = '$_baseUrl/random';

    try {
      final resp = await _networkUtil.getReq(
        '$recipesUrl?apiKey=42a3609943cc4733a41db39a616901d8&number=1&tags=vegetarian,dessert',
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
    final recipesUrl = '$_baseUrl/716429/information';

    try {
      final resp = await _networkUtil.getReq(
        '$recipesUrl?apiKey=42a3609943cc4733a41db39a616901d8',
      );

      Logger().i(resp);

      return RecipeList.fromJson(resp);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }
}
