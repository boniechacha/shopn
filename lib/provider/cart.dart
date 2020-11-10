import 'package:flutter/material.dart';
import 'package:shop_app/provider/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _entries = {};

  Map<String, CartItem> get entries {
    return {..._entries};
  }

  List<CartItem> get items {
    return _entries.values.toList();
  }

  int get count {
    return _entries.length;
  }

  double get total {
    return items.fold(0.0, (total, item) => total + item.cost);
  }

  void clear() {
    this._entries = {};
    notifyListeners();
  }

  void addProduct(Product product) {
    if (_entries.containsKey(product.id))
      _entries.update(product.id, (item) {
        CartItem update = item.clone();
        update.quantity += 1;
        return update;
      });
    else
      _entries.putIfAbsent(product.id, () => new CartItem.of(product));

    notifyListeners();
  }

  void removeItem(String productId) {
    _entries.remove(productId);
    notifyListeners();
  }

  int getQuantity(String productId) {
    if (!_entries.containsKey(productId))
      return 0;
    else {
      return _entries[productId].quantity;
    }
  }

  void removeProduct(String productId) {
    var quantity = getQuantity(productId);
    if (quantity == 0)
      throw new Exception("No product in the cart");
    else if (quantity == 1)
      _entries.remove(productId);
    else {
      _entries.update(productId, (item) {
        CartItem update = item.clone();
        update.quantity -= 1;
        return update;
      });
    }

    notifyListeners();
  }
}

class CartItem {
  String id;
  final String productId;
  final String name;
  int quantity;
  final double price;

  CartItem(this.productId, this.name, this.quantity, this.price) {
    this.id = DateTime.now().toString();
  }

  CartItem.of(Product product)
      : this(product.id, product.name, 1, product.price);

  double get cost {
    return price * quantity;
  }

  CartItem clone() {
    return new CartItem(productId, name, quantity, price);
  }
}
