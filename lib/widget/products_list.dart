import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/product.dart';
import 'package:shop_app/provider/products.dart';
import 'package:shop_app/widget/product_list_item.dart';

class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<Products>(context).items;

    return ListView.builder(
      itemBuilder: (cxt, index) => new ProductListItem(products[index]),
      itemCount: products.length,
    );
  }
}
