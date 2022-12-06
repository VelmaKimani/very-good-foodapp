import 'package:bloc/bloc.dart';
import 'package:foodapp/models/_index.dart';
import 'package:foodapp/services/_index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'get_random_recipes_cubit.freezed.dart';
part 'get_random_recipes_state.dart';

class GetRandomRecipesCubit extends Cubit<GetRandomRecipesState> {
  GetRandomRecipesCubit({
    required RecipesService recipesService,
  }) : super(const GetRandomRecipesState.initial()) {
    _recipesService = recipesService;
  }
  late RecipesService _recipesService;

  Future<void> getRecipes() async {
    emit(const GetRandomRecipesState.loading());
    try {
      final result = await _recipesService.getRandomRecipes();
      Logger().i(result);

      emit(GetRandomRecipesState.loaded(result));
    } on Failure catch (e) {
      emit(GetRandomRecipesState.error(e.message));
    } catch (e) {
      Logger().e(e.toString());
      emit(const GetRandomRecipesState.error('Failed to fetch recipes'));
    }
  }
}
