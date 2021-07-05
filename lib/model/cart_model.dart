import 'package:ecommerce/model/model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  double get subTotal =>
      products.fold(0, (total, current) => total + current.price);
  String get subTotalString => subTotal.toStringAsFixed(2);

  double deleveryFee(subTotal) {
    if (subTotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String freeDelevery(subTotal) {
    if (subTotal >= 30.0) {
      return 'You have Free Delevery';
    } else {
      double missing = 30.0 - subTotal;
      return 'Add \$${missing.toStringAsFixed(2)} For Free Delevery';
    }
  }

  double total(subTotal) {
    return subTotal + deleveryFee(subTotal);
  }

  String get totalString => total(subTotal).toStringAsFixed(2);
  String get freeDeleveryString => freeDelevery(subTotal);
  String get deleveryFeeString => deleveryFee(subTotal).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
