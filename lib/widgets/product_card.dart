import 'package:ecommerce/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/bloc/wishlist/wishlist_bloc.dart';

import 'package:ecommerce/model/model.dart';
import 'package:ecommerce/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double? widthFactor;
  final double? leftPosition;
  final bool isWishlist;
  const ProductCard({
    Key? key,
    this.leftPosition = 5,
    required this.product,
    this.widthFactor = 2.5,
    this.isWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlistBloc = BlocProvider.of<WishlistBloc>(context);
    final double widthValue = MediaQuery.of(context).size.width / widthFactor!;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductScreen.routeName,
            arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: widthValue - 10,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          // Positioned(
          //   top: 60,
          //   left: widthValue - 10 - leftPosition!,
          //   child: Container(
          //     width: widthValue,
          //     height: 80,
          //     decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
          //   ),
          // ),
          Positioned(
            top: 65,
            left: leftPosition! - 5,
            child: Container(
              height: 70,
              width: widthValue - 10 - leftPosition!,
              decoration: BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name!,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoadingState)
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        if (state is CartLoadedState) {
                          return Expanded(
                            child: IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(AddCartProductEvent(product));
                              },
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ),
                            ),
                          );
                        } else {
                          return Text('Something went wrong');
                        }
                      },
                    ),
                    isWishlist
                        ? Expanded(
                            child: BlocBuilder<WishlistBloc, WishlistState>(
                              builder: (context, state) {
                                return IconButton(
                                  onPressed: () {
                                    //   context.read<WishlistBloc>().add(RemoveWishlistProductEvent)
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
