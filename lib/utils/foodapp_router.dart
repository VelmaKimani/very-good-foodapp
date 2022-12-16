part of foodapp_utils;

class FoodAppRouter {
  static const String homeRoute = '/';
  static const String instructionsRoute = '/instructionsRoute';
  static const String searchResultsRoute = '/searchResultsRoute';
  static const String ingredients = '/ingredients';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final _args = settings.arguments;

    switch (settings.name) {
      case homeRoute:
        return _route(
          const HomeScreen(),
        );

      case searchResultsRoute:
        return _route(
          const SearchResultsScreen(),
        );
      case ingredients:
        // ignore: cast_nullable_to_non_nullable
        final recipes = <Recipe>[];
        final extendedIngredients = <ExtendedIngredient>[];
        return _route(
          Ingredients(
            recipes: recipes,
            extendedIngredients: extendedIngredients,
          ),
        );
      default:
        return _route(
          Scaffold(
            appBar: AppBar(
              title: const Text('MoneyApp'),
            ),
            body: const Center(
              child: Text('MoneyApp'),
            ),
          ),
        );
    }
  }

  static Route<dynamic> _route(Widget page) {
    return CupertinoPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
    );
  }
}
