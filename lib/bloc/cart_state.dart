import 'package:copy_with_extension/copy_with_extension.dart';

part 'cart_state.g.dart';

@CopyWith()
class CartScreenState {
  final int noOfItems;

  CartScreenState({required this.noOfItems});
}
