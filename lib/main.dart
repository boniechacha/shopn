import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screen/cart_screen.dart';
import 'package:shop_app/screen/orders_screen.dart';
import 'package:shop_app/screen/product_editor_screen.dart';
import 'package:shop_app/screen/product_screen.dart';
import 'package:shop_app/screen/products_config_screen.dart';
import 'package:shop_app/screen/products_shop_screen.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/provider/orders.dart';
import 'package:shop_app/provider/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => new Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => new Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => new Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'Shop\'n',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.yellow[300],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: ProductsShopScreen.ROUTE,
        routes: {
          ProductsShopScreen.ROUTE: (_) => new ProductsShopScreen(),
          ProductScreen.ROUTE: (_) => new ProductScreen(),
          CartScreen.ROUTE: (_) => new CartScreen(),
          OrdersScreen.ROUTE: (_) => new OrdersScreen(),
          ProductsConfigScreen.ROUTE: (_) => new ProductsConfigScreen(),
          ProductEditor.ROUTE: (_) => new ProductEditor(),
        },
      ),
    );
  }
}
