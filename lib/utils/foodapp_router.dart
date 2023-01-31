part of foodapp_utils;

class FoodAppRouter {
  static const String homeRoute = '/';
  static const String ingredientsRoute = '/ingredientsRoute';
  static const String searchResultsRoute = '/searchResultsRoute';
  static const String signUpRoute = '/signUpRoute';
  static const String googleSignInRoute = '/googleSignInRoute';
  static const String landingRoute = '/landingRoute';
  static const String successRoute = '/successRoute';
  static const String loginRoute = '/loginRoute';
  static const String logoutRoute = '/logoutRoute';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case homeRoute:
        return _route(
          const HomeScreen(),
        );
      case ingredientsRoute:
        final recipe = args as Recipe?;
        return _route(
          Ingredients(recipe: recipe!),
        );
      case searchResultsRoute:
        return _route(
          SearchScreen(),
        );
      case signUpRoute:
        return _route(
          SignUpScreen(),
        );
      case googleSignInRoute:
        return _route(
          GoogleSignInScreen(),
        );
      case loginRoute:
        return _route(
          LoginScreen(),
        );
      case logoutRoute:
        return _route(
          LogoutScreen(),
        );
      case landingRoute:
        return _route(
          LandingScreen(),
        );
      case successRoute:
        return _route(
          SuccessScreen(),
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
