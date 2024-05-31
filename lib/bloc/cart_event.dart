import 'package:catalogue_app/model/item_model.dart';

abstract class CartScreenEvent {}

class AddToCartEvent extends CartScreenEvent {
  final ItemModel itemModel;

  AddToCartEvent({required this.itemModel});
}

class RemoveFromCartEvent extends CartScreenEvent {
  final ItemModel itemModel;

  RemoveFromCartEvent({required this.itemModel});
}

class CartTotalPrice extends CartScreenEvent {}
