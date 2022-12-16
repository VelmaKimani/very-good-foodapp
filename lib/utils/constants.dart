part of foodapp_utils;

class FoodAppValues {
  FoodAppValues({
    required this.baseDomain,
    this.randomRecipeUrl =
        '/random?apiKey=42a3609943cc4733a41db39a616901d8&number=15',
    this.informationRecipe =
        '/{id}/information?apiKey=fe5ded9893c54b719db26c0f774ff438&includeNutrition=false',
    this.imagesUrl = 'https://spoonacular.com/cdn/ingredients_100x100/',
    this.searchRecipe =
        '/complexSearch?apiKey=42a3609943cc4733a41db39a616901d8&query=pasta&maxFat=25',
  });

  final String baseDomain;
  final String? randomRecipeUrl;
  String? informationRecipe;
  String? imagesUrl;
  final String searchRecipe;
}

class FoodAppConfig {
  factory FoodAppConfig({required FoodAppValues values}) {
    return _instance ??= FoodAppConfig._internal(values);
  }

  FoodAppConfig._internal(this.values);

  final FoodAppValues values;
  static FoodAppConfig? _instance;

  static FoodAppConfig? get instance => _instance;
}
