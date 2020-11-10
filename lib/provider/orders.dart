import 'package:flutter/material.dart';
import 'package:shop_app/provider/cart.dart';

class Orders with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  int get count {
    return _orders.length;
  }

  void addOrder(List<CartItem> items) {
    _orders.add(Order.of(items));
    notifyListeners();
  }
}

class Order {
  String id;
  DateTime time;
  List<CartItem> items;

  Order(this.id, this.time, this.items);

  Order.of(List<CartItem> items) {
    this.time = DateTime.now();
    this.id = this.time.toString();
    this.items = items;
  }

  double get total {
    return items.fold(0.0, (total, item) => total + item.cost);
  }
}
