import 'package:catalogue_app/bloc/cart_bloc.dart';
import 'package:catalogue_app/bloc/cart_state.dart';
import 'package:catalogue_app/model/item_model.dart';
import 'package:catalogue_app/page/payment_successful.dart';
import 'package:catalogue_app/widget/cart_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  final List<ItemModel> cartItemModelList;
  const CartPage({required this.cartItemModelList, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenBloc, CartScreenState>(
      builder: (context, state) {
        double totalPrice = 0;
        List<double> totalPriceList = List.generate(state.cartItemsList.length,
            (index) => state.cartItemsList[index].price);
        for (double i in totalPriceList) {
          totalPrice = totalPrice + i;
        }

        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Cart Page',
                style: TextStyle(fontSize: 30),
              ),
            ),
            persistentFooterButtons: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.purple[400],
                    borderRadius: BorderRadius.circular(10)),
                height: 80,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Total Price',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '\$ ${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PaymentSuccessful()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                            color: Colors.purple,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Text(
                          'Pay Now',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
            body: CartProductList(
              cartProductList: cartItemModelList,
            ));
      },
    );
  }
}
