import 'dart:convert';
import 'package:catalogue_app/bloc/cart_bloc.dart';
import 'package:catalogue_app/bloc/cart_event.dart';
import 'package:catalogue_app/bloc/cart_state.dart';
import 'package:catalogue_app/model/cart_model.dart';
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
  // DBHelper? dbHelper = DBHelper();
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
    print(body);
    return body;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenBloc, CartScreenState>(
      builder: (context, state) {
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
                CartModel cart = CartModel.fromMap(products[index]);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      cart.image!,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cart.name!,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '₹ ${cart.price} / ${cart.unit!}',
                          style: const TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                    Container(
                      height: 35,
                      width: 120,
                      color: indexList.contains(index)
                          ? Colors.grey
                          : Colors.green,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            bloc.add(IncrementEvent());

                            // setState(() {
                            //   if (indexList.contains(index)) {
                            //     indexList.remove(index);
                            //   } else {
                            //     indexList.add(index);
                            //   }
                            //   widget.callBack(indexList.length);
                            // });
                          },
                          child: const Text(
                            '🛒 Add To Cart',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
