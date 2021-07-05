part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class StartWishlistEvent extends WishlistEvent {}

class AddWishlistProductEvent extends WishlistEvent {
  final Product product;
  const AddWishlistProductEvent(this.product);
  @override
  List<Object> get props => [product];
}

class RemoveWishlistProductEvent extends WishlistEvent {
  final Product product;
  const RemoveWishlistProductEvent(this.product);
  @override
  List<Object> get props => [product];
}
