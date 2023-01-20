part of foodapp_utils;

class FoodAppRouter {
  static const String homeRoute = '/';
  static const String searchResultsRoute = '/searchResultsRoute';
  static const String signUpRoute = '/signUpRoute';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _route(
          const HomeScreen(),
        );
      case searchResultsRoute:
        return _route(
          SearchScreen(),
        );
      case signUpRoute:
        return _route(
          SignUpScreen(),
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
