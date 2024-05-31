import 'package:catalogue_app/model/item_model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'cart_state.g.dart';

@CopyWith()
class CartScreenState {
  final List<ItemModel> itemsList;
  final List<ItemModel> cartItemsList;

  CartScreenState({required this.itemsList, required this.cartItemsList});
}
