import 'dart:convert';
import 'package:catalogue_app/bloc/cart_bloc.dart';
import 'package:catalogue_app/bloc/cart_event.dart';
import 'package:catalogue_app/bloc/cart_state.dart';
import 'package:catalogue_app/model/item_model.dart';
import 'package:catalogue_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<Map<String, dynamic>> _productFuture;
  late bool isSelected;
  late List<int> indexList;
  @override
  void initState() {
    super.initState();
    isSelected = false;
    indexList = [];
    _productFuture = productData();
  }

  Future<Map<String, dynamic>> productData() async {
    Response snapshot = await ApiServices().getProduct();
    Map<String, dynamic> body = jsonDecode(snapshot.body);

    return body;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenBloc, CartScreenState>(
      builder: (context, state) {
        const itemAddedMessage = SnackBar(
            content: Text('Your item has been added in cart successfully !'));
        const itemAlreadyAddedMessage =
            SnackBar(content: Text('Your item already in cart !'));
        final bloc = context.read<CartScreenBloc>();

        return FutureBuilder<Map<String, dynamic>>(
          future: _productFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!['products'] == null) {
              return const Center(child: Text('No data available'));
            }
            List products = snapshot.data!['products'];
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                ItemModel itemModel = ItemModel.fromJson(products[index]);
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            if (state.itemsList
                                .any((e) => e.id == itemModel.id)) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(itemAlreadyAddedMessage);
                            } else {
                              bloc.add(AddToCartEvent(itemModel: itemModel));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(itemAddedMessage);
                            }
                          },
                          child: Container(
                            height: 30,
                            width: 70,
                            color: state.cartItemsList.any(
                                    (element) => element.id == itemModel.id)
                                ? Colors.grey
                                : Colors.purple,
                            child: const Center(
                              child: Text(
                                'Add 🛒',
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
      },
    );
  }
}
