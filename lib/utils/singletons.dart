part of foodapp_utils;

class Singletons {
  static final _recipesService = RecipesServiceImplementation();
  static final _authService = AuthServiceImplementation();

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
        BlocProvider<SignupCubit>(
          create: (context) => SignupCubit(
            authService: _authService,
          ),
        ),
        BlocProvider<GetSearchRecipeCubit>(
          create: (context) => GetSearchRecipeCubit(
            recipesService: _recipesService,
          ),
        ),
        BlocProvider<GoogleSignInCubit>(
          create: (context) => GoogleSignInCubit(
            authService: _authService,
          ),
        ),
      ];
}
