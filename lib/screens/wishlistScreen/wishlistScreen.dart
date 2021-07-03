import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => WishlistScreen(),
    );
  }

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.4,
          mainAxisSpacing: 5,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        itemCount: Product.products.length,
        itemBuilder: (_, i) {
          return Center(
            child: ProductCard(
              product: Product.products[0],
              widthFactor: 1.1,
              leftPosition: 100,
              isWishlist: true,
            ),
          );
        },
      ),
    );
  }
}
