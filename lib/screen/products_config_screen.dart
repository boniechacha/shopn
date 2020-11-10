import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/app_drawer.dart';
import 'package:shop_app/screen/product_editor_screen.dart';
import 'package:shop_app/widget/products_list.dart';

class ProductsConfigScreen extends StatelessWidget {
  static const String ROUTE = "/products-config";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Products"),
        actions: [
          new IconButton(
              icon: Icon(Icons.add),
              onPressed: () =>
                  Navigator.of(context).pushNamed(ProductEditor.ROUTE)),
        ],
      ),
      body: new ProductsList(),
      drawer: new AppDrawer(),
    );
  }
}
