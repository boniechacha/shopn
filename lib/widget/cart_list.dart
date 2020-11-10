import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widget/cart_list_item.dart';
import 'package:shop_app/provider/cart.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);

    return new ListView.builder(
      itemBuilder: (context, index) => new CartListItem(cart.items[index]),
      itemCount: cart.count,
    );
  }
}
