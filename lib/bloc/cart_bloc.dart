import 'package:catalogue_app/bloc/cart_event.dart';
import 'package:catalogue_app/bloc/cart_state.dart';
import 'package:catalogue_app/model/item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(CartScreenState(itemsList: [], cartItemsList: [])) {
    on<AddToCartEvent>(itemAddToCart);
    on<RemoveFromCartEvent>(itemRemoveFromCart);
  }

  itemAddToCart(AddToCartEvent event, Emitter<CartScreenState> emit) {
    List<ItemModel> itemModelList = state.cartItemsList;
    itemModelList.add(event.itemModel);
    emit(state.copyWith(itemsList: itemModelList));
  }

  itemRemoveFromCart(RemoveFromCartEvent event, Emitter<CartScreenState> emit) {
    List<ItemModel> itemModelList = state.cartItemsList;
    itemModelList.remove(event.itemModel);
    emit(state.copyWith(itemsList: itemModelList));
  }
}
