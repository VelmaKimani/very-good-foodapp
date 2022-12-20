part of foodapp_utils;

class FoodAppRouter {
  static const String homeRoute = '/';
  static const String instructionsRoute = '/instructionsRoute';
  static const String searchResultsRoute = '/searchResultsRoute';
  static const String ingredients = '/ingredients';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case homeRoute:
        return _route(
          const HomeScreen(),
        );
      case searchResultsRoute:
        final search = args as String?;
        return _route(
          SearchResultsScreen(
            searching: search!,
          ),
        );
      case ingredients:
        final recipe = args as Recipe?;
        return _route(
          Ingredients(
            recipe: recipe!,
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
