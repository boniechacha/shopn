import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/app_drawer.dart';
import 'package:shop_app/widget/orders_list.dart';

class OrdersScreen extends StatelessWidget {
  static const String ROUTE = "/orders";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Orders"),
      ),
      body: new OrdersList(),
      drawer: new AppDrawer(),
    );
  }
}
