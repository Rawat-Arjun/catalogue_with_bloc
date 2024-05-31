import 'package:catalogue_app/bloc/cart_bloc.dart';
import 'package:catalogue_app/bloc/cart_event.dart';
import 'package:catalogue_app/bloc/cart_state.dart';
import 'package:catalogue_app/model/item_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductList extends StatefulWidget {
  final List<ItemModel> cartProductList;
  const CartProductList({required this.cartProductList, super.key});

  @override
  State<CartProductList> createState() => _ProductListState();
}

class _ProductListState extends State<CartProductList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenBloc, CartScreenState>(
      builder: (context, state) {
        final bloc = context.read<CartScreenBloc>();
        return ListView.builder(
          itemCount: widget.cartProductList.length,
          itemBuilder: (context, index) {
            ItemModel itemModel = widget.cartProductList[index];
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.network(
                      itemModel.images,
                      height: 50,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            itemModel.title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$ ${itemModel.price}',
                                style: const TextStyle(fontSize: 17),
                              ),
                              Row(
                                children: [
                                  Image.network(
                                    'https://t3.ftcdn.net/jpg/01/09/84/42/360_F_109844239_A7MdQSDf4y1H80cfvHZuSa0zKBkZ68S7.jpg',
                                    height: 20,
                                    width: 20,
                                    fit: BoxFit.fill,
                                  ),
                                  Text(itemModel.rating.toString())
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: () {
                        bloc.add(RemoveFromCartEvent(itemModel: itemModel));
                      },
                      child: Container(
                        height: 30,
                        width: 80,
                        color: Colors.purple,
                        child: const Center(
                          child: Text(
                            'Remove 🛒',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
