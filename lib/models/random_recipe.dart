part of '_index.dart';

@freezed
class RecipeList with _$RecipeList {
  factory RecipeList(
    List<Recipe> recipes,
  ) = _RecipeList;

  factory RecipeList.fromJson(Map<String, dynamic> json) =>
      _$RecipeListFromJson(json);
}

@freezed
class Recipe with _$Recipe {
  factory Recipe({
    bool? vegetarian,
    bool? vegan,
    bool? glutenFree,
    bool? dairyFree,
    bool? veryHealthy,
    bool? cheap,
    bool? veryPopular,
    bool? sustainable,
    bool? lowFodmap,
    int? weightWatcherSmartPoints,
    String? gaps,
    int? preparationMinutes,
    int? cookingMinutes,
    int? aggregateLikes,
    int? healthScore,
    String? creditsText,
    String? license,
    String? sourceName,
    double? pricePerServing,
    List<ExtendedIngredient>? extendedIngredients,
    int? id,
    String? title,
    int? readyInMinutes,
    int? servings,
    String? sourceUrl,
    String? image,
    String? imageType,
    String? summary,
    List<String>? cuisines,
    List<String>? dishTypes,
    List<String>? diets,
    List<dynamic>? occasions,
    String? instructions,
    List<AnalyzedInstruction>? analyzedInstructions,
    dynamic originalId,
    String? spoonacularSourceUrl,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

@freezed
class AnalyzedInstruction with _$AnalyzedInstruction {
  factory AnalyzedInstruction(
    String? name,
    List<Step>? steps,
  ) = _AnalyzedInstruction;

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) =>
      _$AnalyzedInstructionFromJson(json);
}

@freezed
class Step with _$Step {
  factory Step(
    int? number,
    String? step,
    List<Ent>? ingredients,
    List<Ent>? equipment,
    Length? length,
  ) = _Step;

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
}

@freezed
class Ent with _$Ent {
  factory Ent(
    int? id,
    String? name,
    String? localizedName,
    String? image,
  ) = _Ent;

  factory Ent.fromJson(Map<String, dynamic> json) => _$EntFromJson(json);
}

@freezed
class Length with _$Length {
  factory Length(
    int? number,
    String? unit,
  ) = _Length;

  factory Length.fromJson(Map<String, dynamic> json) => _$LengthFromJson(json);
}

@freezed
class ExtendedIngredient with _$ExtendedIngredient {
  factory ExtendedIngredient({
    int? id,
    String? aisle,
    String? image,
    Consistency? consistency,
    String? name,
    String? nameClean,
    String? original,
    String? originalName,
    double? amount,
    String? unit,
    List<String>? meta,
    Measures? measures,
  }) = _ExtendedIngredient;

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) =>
      _$ExtendedIngredientFromJson(json);
}

enum Consistency { solid, liquid }

final consistencyValues =
    EnumValues({'liquid': Consistency.liquid, 'solid': Consistency.solid});

@freezed
class Measures with _$Measures {
  factory Measures(
    Metric? us,
    Metric? metric,
  ) = _Measures;

  factory Measures.fromJson(Map<String, dynamic> json) =>
      _$MeasuresFromJson(json);
}

@freezed
class Metric with _$Metric {
  factory Metric(
    double? amount,
    String? unitShort,
    String? unitLong,
  ) = _Metric;

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
