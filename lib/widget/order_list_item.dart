import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/provider/orders.dart';

class OrderListItem extends StatefulWidget {
  final Order order;

  OrderListItem(this.order);

  @override
  _OrderListItemState createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: new Text("${this.widget.order.total.toStringAsFixed(2)}/="),
            subtitle: new Text(this.widget.order.time.toString()),
            trailing: new IconButton(
                icon: Icon(
                    this._expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    this._expanded = !this._expanded;
                  });
                }),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: min(max(this.widget.order.items.length * 25.0, 50), 125),
              child: ListView(
                children: this
                    .widget
                    .order
                    .items
                    .map(
                      (item) => new OrderItemSummary(item),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}

class OrderItemSummary extends StatelessWidget {
  final CartItem item;

  OrderItemSummary(this.item);

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: [
        new Text(this.item.name),
        new Spacer(),
        new Text(this.item.price.toString()),
        new Text("x ${this.item.quantity}"),
      ],
    );
  }
}
