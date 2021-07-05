part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStartedEvent extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddCartProductEvent extends CartEvent {
  final Product product;
  const AddCartProductEvent(this.product);
  @override
  List<Object> get props => [product];
}

class RemoveCartProductEvent extends CartEvent {
  final Product product;
  const RemoveCartProductEvent(this.product);
  @override
  List<Object> get props => [product];
}
