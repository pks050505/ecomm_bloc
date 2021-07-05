import 'package:ecommerce/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartScreen(),
    );
  }

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text('GO TO CHECKOUT',
                    style: Theme.of(context).textTheme.headline3!),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadingState)
            return Center(child: CircularProgressIndicator());
          if (state is CartLoadedState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.cart.freeDeleveryString,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              elevation: 0,
                              shape: RoundedRectangleBorder(),
                            ),
                            child: Text('Add More Items'),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: state.cart.products.length,
                          itemBuilder: (_, i) {
                            return CardProductCard(
                              product: state.cart.products[i],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Divider(thickness: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SUBTOTAL',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Text(
                                  '\$${state.cart.subTotalString}',
                                  style: Theme.of(context).textTheme.headline6,
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'DELEVERY FEE',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Text(
                                  '\$${state.cart.deleveryFeeString}',
                                  style: Theme.of(context).textTheme.headline6,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.black.withAlpha(50)),
                          ),
                          Container(
                            height: 50,
                            margin: const EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.black),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'TOTAL',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    '\$${state.cart.totalString}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          } else
            return Text('Something went wrong');
        },
      ),
    );
  }
}
