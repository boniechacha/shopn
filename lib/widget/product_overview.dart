import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/provider/product.dart';
import 'package:shop_app/screen/product_screen.dart';

class ProductOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Product>(context);

    var cartProvider = Provider.of<Cart>(context);

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        ProductScreen.ROUTE,
        arguments: product.id,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          header: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.black87,
                child: new Text(
                  "${product.price} /=",
                  style: new TextStyle(color: Theme.of(context).primaryColor),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          footer: new GridTileBar(
            backgroundColor: Colors.black45,
            title: new Text(
              product.name,
              textAlign: TextAlign.center,
            ),
            leading: new IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(
                product.isFavourite
                    ? Icons.favorite
                    : Icons.favorite_outline_outlined,
              ),
              onPressed: () => product.toggleFavourite(),
            ),
            trailing: new IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                cartProvider.addProduct(product);
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  new SnackBar(
                    content: new Text(
                        "${cartProvider.getQuantity(product.id)} ${product.name} added to cart"),
                    action: new SnackBarAction(
                      label: "UNDO",
                      onPressed: () => cartProvider.removeProduct(product.id),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
