import 'package:bloc/bloc.dart';
import 'package:foodapp/models/_index.dart';
import 'package:foodapp/services/_index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'get_search_recipe_state.dart';
part 'get_search_recipe_cubit.freezed.dart';

class GetSearchRecipeCubit extends Cubit<GetSearchRecipeState> {
  GetSearchRecipeCubit({
    required RecipesService recipesService,
  }) : super(const GetSearchRecipeState.initial()) {
    _recipesService = recipesService;
  }
  late RecipesService _recipesService;

  Future<void> getSearchRecipe({
    required String name,
  }) async {
    emit(const GetSearchRecipeState.loading());
    try {
      final result = await _recipesService.getsearchRecipe(name: name);
      Logger().i(result.results);

      if (result.results.contains(name)) {
        emit(GetSearchRecipeState.loaded(result.results));
      } else {
        Logger().i('results not loaded');
      }
    } on Failure catch (e) {
      emit(GetSearchRecipeState.error(e.message));
    } catch (e) {
      Logger().e(e.toString());
      emit(
        const GetSearchRecipeState.error(
          'Failed to fetch searched recipes',
        ),
      );
    }
  }
}
