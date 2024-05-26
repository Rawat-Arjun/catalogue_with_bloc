import 'package:catalogue_app/bloc/cart_event.dart';
import 'package:catalogue_app/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(CartScreenState(noOfItems: 0)) {
    on<IncrementEvent>(_increment);
  }

  void _increment(IncrementEvent event, Emitter<CartScreenState> emit) {
    emit(state.copyWith(noOfItems: state.noOfItems + 1));
  }
}
