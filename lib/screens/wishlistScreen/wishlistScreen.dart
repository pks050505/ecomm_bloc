import 'package:ecommerce/bloc/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/model/model.dart';

import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    // final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: CustomNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoadingState)
            return Center(child: CircularProgressIndicator());
          if (state is WishlistLoadedState) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.4,
                mainAxisSpacing: state.wishlist.products.length == 0 ? 0 : 5,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              itemCount: state.wishlist.products.length,
              itemBuilder: (_, i) {
                return Center(
                  child: ProductCard(
                    product: state.wishlist.products[i],
                    widthFactor: 1.1,
                    leftPosition: 100,
                    isWishlist: true,
                  ),
                );
              },
            );
          } else {
            return Text('Something went wront...');
          }
        },
      ),
    );
  }
}
