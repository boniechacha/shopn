import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/provider/orders.dart';

class CartHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    var orders = Provider.of<Orders>(context, listen: false);

    return new Container(
      padding: EdgeInsets.all(5),
      child: new Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Row(
            children: [
              new Text(
                "Total",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                width: 10,
              ),
              new Chip(
                label: Text("${cart.total}/="),
              ),
              new Spacer(),
              new FlatButton(
                onPressed: () {
                  orders.addOrder(cart.items);
                  cart.clear();
                },
                child: new Text(
                  "Place Order",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
