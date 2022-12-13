part of foodapp_utils;

class FoodAppRouter {
  static const String homeRoute = '/';
  static const String instructionsRoute = '/instructionsRoute';
  static const String searchRoute = '/searchRoute';
  static const String searchResultsRoute = '/searchResultsRoute';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _route(
          const HomeScreen(),
        );
      case searchRoute:
        return _route(
          const SearchScreen(),
        );
      case searchResultsRoute:
        return _route(
          const SearchResultsScreen(),
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
