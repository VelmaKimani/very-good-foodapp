part of foodapp_utils;

class FoodAppRouter {
  static const String homeRoute = '/';
  static const String instructionsRoute = '/instructionsRoute';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _route(
          HomeScreen(),
        );
      case instructionsRoute:
        return _route(const InstructionsScreen());

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
