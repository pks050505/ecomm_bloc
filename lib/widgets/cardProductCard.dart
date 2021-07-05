import 'package:ecommerce/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardProductCard extends StatelessWidget {
  final Product product;
  const CardProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name!,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                '\$${product.price}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          SizedBox(width: 10),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(RemoveCartProductEvent(product));
                      },
                      icon: Icon(Icons.remove_circle)),
                  Text(
                    '1',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(AddCartProductEvent(product));
                      },
                      icon: Icon(Icons.add_circle)),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
