part of foodapp_utils;

class FoodAppValues {
  FoodAppValues({
    required this.baseDomain,
    required this.hiveBox,
    this.randomRecipeUrl = 'https://api.spoonacular.com/recipes/random',
  });

  final String baseDomain;
  String? randomRecipeUrl;
  final String hiveBox;
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
