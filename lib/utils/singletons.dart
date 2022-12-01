part of foodapp_utils;

class Singletons {
  static final _recipesService = RecipesServiceImplementation();

  static List<BlocProvider> registerCubits() => <BlocProvider>[
        BlocProvider<GetRandomRecipesCubit>(
          create: (context) => GetRandomRecipesCubit(
            recipesService: _recipesService,
          ),
        ),
        BlocProvider<GetInfoRecipesCubit>(
          create: (context) => GetInfoRecipesCubit(
            recipesService: _recipesService,
          ),
        ),
      ];
}
