import 'package:flutter/material.dart';
import 'package:shop_app/screen/orders_screen.dart';
import 'package:shop_app/screen/products_config_screen.dart';
import 'package:shop_app/screen/products_shop_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new Column(
        children: [
          // new DrawerHeader(
          //   child: new Container(

          //     child: new Text("Boniface Chacha"),
          //   ),
          // ),
          new AppBar(
            title: new Text("Boniface Chacha"),
            automaticallyImplyLeading: false,
          ),
          new ListTile(
            leading: new Icon(Icons.shop),
            title: new Text("Shop"),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(ProductsShopScreen.ROUTE),
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(Icons.credit_card),
            title: new Text("Orders"),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(OrdersScreen.ROUTE),
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(Icons.credit_card),
            title: new Text("Products"),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(ProductsConfigScreen.ROUTE),
          ),
        ],
      ),
    );
  }
}
