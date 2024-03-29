part of '_index.dart';

class FoodAppValues {
  FoodAppValues({
    required this.baseDomain,
    this.randomRecipeUrl =
        '/random?apiKey=db37873069e14be78379403fb6f758c3&number=15',
    this.informationRecipe =
        '/344/information?apiKey=db37873069e14be78379403fb6f758c3&includeNutrition=false',
    this.imagesUrl = 'https://spoonacular.com/cdn/ingredients_100x100/',
    this.searchRecipe =
        '/complexSearch?apiKey=db37873069e14be78379403fb6f758c3&query=',
    this.firebaseUrl =
        'https://foodapp-2c2cc-default-rtdb.firebaseio.com/.json',
  });

  final String baseDomain;
  final String? randomRecipeUrl;
  String? informationRecipe;
  String? imagesUrl;
  final String searchRecipe;
  final String firebaseUrl;
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
