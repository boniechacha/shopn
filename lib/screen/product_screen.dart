import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/products.dart';

class ProductScreen extends StatelessWidget {
  static const String ROUTE = "/product";

  @override
  Widget build(BuildContext context) {
    var productId = ModalRoute.of(context).settings.arguments as String;
    var product =
        Provider.of<Products>(context, listen: false).findProduct(productId);
    return Scaffold(
      appBar: new AppBar(
        title: new Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: new Column(
            children: [
              new Container(
                width: double.infinity,
                child: Card(
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              new SizedBox(
                height: 10,
              ),
              new Text(
                "${product.price}/=",
                style: Theme.of(context).textTheme.headline5,
              ),
              new SizedBox(
                height: 10,
              ),
              new Text(
                product.description,
                textAlign: TextAlign.center,
                softWrap: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
