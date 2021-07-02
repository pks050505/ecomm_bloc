import 'package:ecommerce/model/model.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: products.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.only(right: 5),
            child: ProductCard(product: products[i]),
          );
        },
      ),
    );
  }
}
