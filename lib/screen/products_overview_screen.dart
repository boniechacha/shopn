import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/app_drawer.dart';
import 'package:shop_app/widget/badge.dart';
import 'package:shop_app/screen/cart_screen.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/widget/products_grid.dart';

class ProductsShopScreen extends StatefulWidget {
  static const String ROUTE = "/products-shop";

  @override
  _ProductsShopScreenState createState() => _ProductsShopScreenState();
}

class _ProductsShopScreenState extends State<ProductsShopScreen> {
  bool showFavourites = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Shop\'n"),
        actions: [
          Consumer<Cart>(
            builder: (context, cart, ch) => new Badge(
              color: Colors.black45,
              child: ch,
              value: cart.count.toString(),
            ),
            child: new IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () =>
                  Navigator.of(context).pushNamed(CartScreen.ROUTE),
            ),
          ),
          new PopupMenuButton(
            onSelected: (showFav) {
              setState(() {
                this.showFavourites = showFav;
              });
            },
            itemBuilder: (_) => [
              new PopupMenuItem(
                child: new Text("All"),
                value: false,
              ),
              new PopupMenuItem(
                child: new Text("Favourites"),
                value: true,
              ),
            ],
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: ProductsGrid(favouritesOnly: showFavourites),
      drawer: new AppDrawer(),
    );
  }
}
