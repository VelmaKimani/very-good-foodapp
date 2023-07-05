part of '_index.dart';

@freezed
abstract class RecipeInformation with _$RecipeInformation {
  factory RecipeInformation({
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
    WinePairing? winePairing,
    String? instructions,
    List<AnalyzedInstruction>? analyzedInstructions,
    dynamic originalId,
    String? spoonacularSourceUrl,
  }) = _RecipeInformation;

  factory RecipeInformation.fromJson(Map<String, dynamic> json) =>
      _$RecipeInformationFromJson(json);
}

@freezed
class WinePairing with _$WinePairing {
  factory WinePairing(
    List<PairedWines> pairedWines,
    String? pairingText,
    List<ProductMatches> productMatches,
  ) = _WinePairing;

  factory WinePairing.fromJson(Map<String, dynamic> json) =>
      _$WinePairingFromJson(json);
}

@freezed
class PairedWines with _$PairedWines {
  factory PairedWines() = _PairedWines;

  factory PairedWines.fromJson(Map<String, dynamic> json) =>
      _$PairedWinesFromJson(json);
}

@freezed
class ProductMatches with _$ProductMatches {
  factory ProductMatches() = _ProductMatches;

  factory ProductMatches.fromJson(Map<String, dynamic> json) =>
      _$ProductMatchesFromJson(json);
}

@freezed
class AnalyzedInstructions with _$AnalyzedInstructions {
  factory AnalyzedInstructions() = _AnalyzedInstructions;

  factory AnalyzedInstructions.fromJson(Map<String, dynamic> json) =>
      _$AnalyzedInstructionsFromJson(json);
}
