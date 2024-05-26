import 'package:catalogue_app/widget/product_list.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late int noOfItems;

  @override
  void initState() {
    noOfItems = 0;
    super.initState();
  }

  void badgeCallBack(int val) {
    setState(() {
      noOfItems = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product List',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        actions: [
          Center(
            child: Stack(alignment: Alignment.topRight, children: [
              const Icon(Icons.shopping_bag_outlined, size: 35),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                    padding: EdgeInsets.only(left: 6),
                    height: 20,
                    width: 20,
                    color: Colors.red,
                    child: Text(noOfItems.toString())),
              ),
            ]),
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
      body: ProductList(callBack: badgeCallBack),
    );
  }
}