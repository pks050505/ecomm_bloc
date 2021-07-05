import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/model/model.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoadingState());
  @override
  void onEvent(event) {
    super.onEvent(event);
    print('event $event');
  }

  @override
  void onTransition(transition) {
    super.onTransition(transition);
    print('Transition $transition');
  }

  @override
  Stream<WishlistState> mapEventToState(
    WishlistEvent event,
  ) async* {
    if (event is StartWishlistEvent) {
      yield* _mapStartWishlistEventToState();
    } else if (event is AddWishlistProductEvent) {
      yield* _mapAddWishlistProductEventToState(event, state);
    } else if (event is RemoveWishlistProductEvent) {
      yield* _mapRemoveWishlistProductEventToState(event, state);
    }
  }

  Stream<WishlistState> _mapStartWishlistEventToState() async* {
    yield WishlistLoadingState();
    try {
      await Future.delayed(Duration(seconds: 2));
      yield const WishlistLoadedState();
    } catch (_) {}
  }

  Stream<WishlistState> _mapAddWishlistProductEventToState(
    AddWishlistProductEvent event,
    WishlistState state,
  ) async* {
    if (state is WishlistLoadedState) {
      try {
        yield WishlistLoadedState(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..add(event.product),
          ),
        );
      } catch (_) {}
    }
  }

  Stream<WishlistState> _mapRemoveWishlistProductEventToState(
    RemoveWishlistProductEvent event,
    WishlistState state,
  ) async* {
    if (state is WishlistLoadedState) {
      try {
        yield WishlistLoadedState(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..remove(event.product),
          ),
        );
      } catch (_) {}
    }
  }
}
