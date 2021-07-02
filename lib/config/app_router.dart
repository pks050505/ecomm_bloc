import 'package:ecommerce/model/model.dart';
import 'package:ecommerce/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      default:
        return _errorRoute();
    }
  }

  static _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Column(
            children: [
              Text('Something went wrong...'),
            ],
          ),
        );
      },
    );
  }
}
