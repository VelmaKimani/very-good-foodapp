part of foodapp_utils;

class FoodAppValues {
  FoodAppValues({
    required this.baseDomain,
    this.randomRecipeUrl = 'https://api.spoonacular.com/recipes/random',
    this.informationRecipe =
        'https://api.spoonacular.com/recipes/{id}/information',
  });

  final String baseDomain;
  String? randomRecipeUrl;
  String? informationRecipe;
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
