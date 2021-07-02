import 'package:ecommerce/model/model.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ProductScreen(product: product),
    );
  }

  final Product product;
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: product.name,
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
