import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widget/order_list_item.dart';
import 'package:shop_app/provider/orders.dart';

class OrdersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orders orders = Provider.of<Orders>(context);

    return new ListView.builder(
      itemBuilder: (context, index) => new OrderListItem(orders.orders[index]),
      itemCount: orders.count,
    );
  }
}
