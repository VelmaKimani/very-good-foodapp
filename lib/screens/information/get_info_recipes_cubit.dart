import 'package:bloc/bloc.dart';
import 'package:foodapp/models/_index.dart';
import 'package:foodapp/services/_index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'get_info_recipes_cubit.freezed.dart';
part 'get_info_recipes_state.dart';

class GetInfoRecipesCubit extends Cubit<GetInfoRecipesState> {
  GetInfoRecipesCubit({
    required RecipesService recipesService,
  }) : super(const GetInfoRecipesState.initial()) {
    _recipesService = recipesService;
  }
  late RecipesService _recipesService;

  Future<void> getInfoRecipes() async {
    emit(const GetInfoRecipesState.loading());
    try {
      final result = await _recipesService.getInformationRecipes();

      Logger().i(result);

      emit(GetInfoRecipesState.loaded(result));
    } on Failure catch (e) {
      emit(GetInfoRecipesState.error(e.message));
    } catch (e) {
      Logger().e(e.toString());
      emit(
        const GetInfoRecipesState.error(
          'Failed to fetch information ingredients',
        ),
      );
    }
  }
}
