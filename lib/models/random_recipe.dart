part of foodapp_models;

@freezed
class Welcome with _$Welcome {
  factory Welcome({
    required List<Recipe> recipes,
  }) = _Welcome;

  factory Welcome.fromJson(Map<String, dynamic> json) =>
      _$WelcomeFromJson(json);
}

@freezed
class Recipe with _$Recipe {
  factory Recipe({
    required bool vegetarian,
    required bool vegan,
    required bool glutenFree,
    required bool dairyFree,
    required bool veryHealthy,
    required bool cheap,
    required bool veryPopular,
    required bool sustainable,
    required bool lowFodmap,
    required int weightWatcherSmartPoints,
    required String gaps,
    required int preparationMinutes,
    required int cookingMinutes,
    required int aggregateLikes,
    required int healthScore,
    required String creditsText,
    required String license,
    required String sourceName,
    required double pricePerServing,
    required List<ExtendedIngredient> extendedIngredients,
    required int id,
    required String title,
    required int readyInMinutes,
    required int servings,
    required String sourceUrl,
    required String image,
    required String imageType,
    required String summary,
    required List<String> cuisines,
    required List<String> dishTypes,
    required List<String> diets,
    required List<dynamic> occasions,
    required String instructions,
    required List<AnalyzedInstruction> analyzedInstructions,
    required dynamic originalId,
    required String spoonacularSourceUrl,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

@freezed
class AnalyzedInstruction with _$AnalyzedInstruction {
  factory AnalyzedInstruction({
    required String name,
    required List<Step> steps,
  }) = _AnalyzedInstruction;

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) =>
      _$AnalyzedInstructionFromJson(json);
}

@freezed
class Step with _$Step {
  factory Step({
    required int number,
    required String step,
    required List<Ent> ingredients,
    required List<Ent> equipment,
    required Length length,
  }) = _Step;

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
}

@freezed
class Ent with _$Ent {
  factory Ent({
    required int id,
    required String name,
    required String localizedName,
    required String image,
  }) = _Ent;

  factory Ent.fromJson(Map<String, dynamic> json) => _$EntFromJson(json);
}

@freezed
class Length with _$Length {
  factory Length({
    required int number,
    required String unit,
  }) = _Length;

  factory Length.fromJson(Map<String, dynamic> json) => _$LengthFromJson(json);
}

@freezed
class ExtendedIngredient with _$ExtendedIngredient {
  factory ExtendedIngredient({
    required int id,
    required Aisle aisle,
    required String image,
    required Consistency consistency,
    required String name,
    required String nameClean,
    required String original,
    required String originalName,
    required double amount,
    required String unit,
    required List<String> meta,
    required Measures measures,
  }) = _ExtendedIngredient;

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) =>
      _$ExtendedIngredientFromJson(json);
}

enum Aisle { BAKING, SPICES_AND_SEASONINGS, MILK_EGGS_OTHER_DAIRY }

final aisleValues = EnumValues({
  'Baking': Aisle.BAKING,
  'Milk, Eggs, Other Dairy': Aisle.MILK_EGGS_OTHER_DAIRY,
  'Spices and Seasonings': Aisle.SPICES_AND_SEASONINGS
});

enum Consistency { SOLID, LIQUID }

final consistencyValues =
    EnumValues({'LIQUID': Consistency.LIQUID, 'SOLID': Consistency.SOLID});

@freezed
class Measures with _$Measures {
  factory Measures({
    required Metric us,
    required Metric metric,
  }) = _Measures;

  factory Measures.fromJson(Map<String, dynamic> json) =>
      _$MeasuresFromJson(json);
}

@freezed
class Metric with _$Metric {
  factory Metric({
    required double amount,
    required String unitShort,
    required String unitLong,
  }) = _Metric;

  factory Metric.fromJson(Map<String, dynamic> json) => _$MetricFromJson(json);
}

class EnumValues<T> {
  EnumValues(this.map);
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  Map<T, String> get reverse {
    if (reverseMap.isEmpty) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
