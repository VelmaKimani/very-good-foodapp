part of '_index.dart';

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
  static const String informationRoute = '/informationRoute';

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
          const SearchScreen(),
        );
      case signUpRoute:
        return _route(
          const SignUpScreen(),
        );
      case googleSignInRoute:
        return _route(
          const GoogleSignInScreen(),
        );
      case loginRoute:
        return _route(
          const LoginScreen(),
        );
      case logoutRoute:
        return _route(
          const LogoutScreen(),
        );
      case landingRoute:
        return _route(
          const LandingScreen(),
        );
      case successRoute:
        return _route(
          const SuccessScreen(),
        );
      case informationRoute:
        return _route(
          const Information(),
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
