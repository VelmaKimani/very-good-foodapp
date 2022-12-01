part of foodapp_services;

abstract class RecipesService {
  Future<Recipes> getRandomRecipes();
  Future<Recipes> getInformationRecipes();
}

class RecipesServiceImplementation implements RecipesService {
  final _baseUrl = FoodAppConfig.instance!.values.baseDomain;

  @override
  Future<Recipes> getRandomRecipes() async {
    final recipesUrl = '$_baseUrl/random';

    try {
      final resp = await _networkUtil.getReq(
        '$recipesUrl?apiKey=fe5ded9893c54b719db26c0f774ff438&number=1&tags=vegetarian,dessert',
      );

      Logger().i(resp);

      return Recipes.fromJson(resp);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }

  @override
  Future<Recipes> getInformationRecipes() async {
    final recipesUrl = '$_baseUrl/{id}/information';

    try {
      final resp = await _networkUtil.getReq(
        '$recipesUrl?apiKey=fe5ded9893c54b719db26c0f774ff438&includeNutrition=false',
      );

      Logger().i(resp);

      return Recipes.fromJson(resp);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }
}
