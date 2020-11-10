import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String id;
  String name;
  double price;
  String description;
  String imageUrl;
  bool isFavourite;

  Product({
    this.id,
    this.name,
    this.price,
    this.description,
    this.imageUrl,
    this.isFavourite = false,
  });

  void toggleFavourite() {
    this.isFavourite = !this.isFavourite;
    notifyListeners();
  }
}
