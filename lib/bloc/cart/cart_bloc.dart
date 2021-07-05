import 'dart:async';

import 'package:ecommerce/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoadingState());

  @override
  void onEvent(event) {
    super.onEvent(event);
    print('event $event');
  }

  @override
  void onTransition(transition) {
    super.onTransition(transition);
    print('transition $transition');
  }

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CartStartedEvent) {
      yield* _mapCartStartedEventToState();
    } else if (event is AddCartProductEvent) {
      yield* _mapAddCartProductEventToState(event, state);
    } else if (event is RemoveCartProductEvent) {
      yield* _mapRemoveCartProductEventToState(event, state);
    }
  }

  Stream<CartState> _mapCartStartedEventToState() async* {
    yield CartLoadingState();
    try {
      await Future.delayed(Duration(seconds: 4));
      yield CartLoadedState();
    } catch (_) {}
  }

  Stream<CartState> _mapAddCartProductEventToState(
    AddCartProductEvent event,
    CartState state,
  ) async* {
    if (state is CartLoadedState) {
      try {
        yield CartLoadedState(
          cart: Cart(
            products: List.from(state.cart.products)..add(event.product),
          ),
        );
      } catch (_) {}
    }
  }

  Stream<CartState> _mapRemoveCartProductEventToState(
    RemoveCartProductEvent event,
    CartState state,
  ) async* {
    if (state is CartLoadedState) {
      try {
        yield CartLoadedState(
          cart: Cart(
            products: List.from(state.cart.products)..remove(event.product),
          ),
        );
      } catch (_) {}
    }
  }
}
