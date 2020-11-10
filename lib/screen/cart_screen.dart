import 'package:flutter/material.dart';
import 'package:shop_app/widget/cart_header.dart';
import 'package:shop_app/widget/cart_list.dart';

class CartScreen extends StatelessWidget {
  static const String ROUTE = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Cart"),
      ),
      body: Container(
        child: new Column(
          children: [
            new CartHeader(),
            new Expanded(
              child: new CartList(),
            ),
          ],
        ),
      ),
    );
  }
}
