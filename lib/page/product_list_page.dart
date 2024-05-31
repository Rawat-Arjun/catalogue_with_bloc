import 'package:catalogue_app/bloc/cart_bloc.dart';
import 'package:catalogue_app/bloc/cart_state.dart';
import 'package:catalogue_app/page/cart_page.dart';
import 'package:catalogue_app/widget/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenBloc, CartScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Product List',
              style: TextStyle(fontSize: 30),
            ),
            centerTitle: true,
            actions: [
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(
                          cartItemModelList: state.cartItemsList,
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: 'cart-home',
                    flightShuttleBuilder: (flightContext, animation, direction,
                        fromContext, toContext) {
                      return ScaleTransition(
                        scale: animation.drive(Tween(begin: 0.1, end: 1.0)
                            .chain(CurveTween(curve: Curves.bounceInOut))),
                        child: fromContext.widget,
                      );
                    },
                    child: Badge(
                      largeSize: 20,
                      smallSize: 20,
                      backgroundColor: Colors.purple[300],
                      label: Text(
                        state.cartItemsList.length.toString(),
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      textColor: Colors.white,
                      child: const Icon(
                        Icons.shopping_cart,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
          body: const ProductList(),
        );
      },
    );
  }
}
