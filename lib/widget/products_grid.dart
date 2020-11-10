import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widget/product_overview.dart';
import 'package:shop_app/provider/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool favouritesOnly;

  ProductsGrid({@required this.favouritesOnly});

  @override
  Widget build(BuildContext context) {
    var productsProvider = Provider.of<Products>(context);
    var products = this.favouritesOnly
        ? productsProvider.favourites
        : productsProvider.items;

    return new GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductOverview(),
      ),
      itemCount: products.length,
    );
  }
}
