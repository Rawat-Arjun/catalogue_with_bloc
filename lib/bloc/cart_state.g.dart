// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CartScreenStateCWProxy {
  CartScreenState itemsList(List<ItemModel> itemsList);

  CartScreenState cartItemsList(List<ItemModel> cartItemsList);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CartScreenState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CartScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  CartScreenState call({
    List<ItemModel>? itemsList,
    List<ItemModel>? cartItemsList,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCartScreenState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCartScreenState.copyWith.fieldName(...)`
class _$CartScreenStateCWProxyImpl implements _$CartScreenStateCWProxy {
  const _$CartScreenStateCWProxyImpl(this._value);

  final CartScreenState _value;

  @override
  CartScreenState itemsList(List<ItemModel> itemsList) =>
      this(itemsList: itemsList);

  @override
  CartScreenState cartItemsList(List<ItemModel> cartItemsList) =>
      this(cartItemsList: cartItemsList);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CartScreenState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CartScreenState(...).copyWith(id: 12, name: "My name")
  /// ````
  CartScreenState call({
    Object? itemsList = const $CopyWithPlaceholder(),
    Object? cartItemsList = const $CopyWithPlaceholder(),
  }) {
    return CartScreenState(
      itemsList: itemsList == const $CopyWithPlaceholder() || itemsList == null
          ? _value.itemsList
          // ignore: cast_nullable_to_non_nullable
          : itemsList as List<ItemModel>,
      cartItemsList:
          cartItemsList == const $CopyWithPlaceholder() || cartItemsList == null
              ? _value.cartItemsList
              // ignore: cast_nullable_to_non_nullable
              : cartItemsList as List<ItemModel>,
    );
  }
}

extension $CartScreenStateCopyWith on CartScreenState {
  /// Returns a callable class that can be used as follows: `instanceOfCartScreenState.copyWith(...)` or like so:`instanceOfCartScreenState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CartScreenStateCWProxy get copyWith => _$CartScreenStateCWProxyImpl(this);
}
