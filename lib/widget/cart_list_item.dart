import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';

class CartListItem extends StatelessWidget {
  final CartItem cartItem;

  CartListItem(this.cartItem);

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: false);

    return Dismissible(
        key: ValueKey(cartItem.id),
        direction: DismissDirection.endToStart,
        confirmDismiss: (dir) {
          return showDialog(
            context: context,
            builder: (ctx) => new AlertDialog(
              title: new Text("Please confirm"),
              content:
                  new Text("Should ${cartItem.name} be removed from the cart?"),
              actions: [
                new FlatButton(
                  child: new Text("Proceed"),
                  onPressed: () => Navigator.of(ctx).pop(true),
                ),
                new FlatButton(
                  child: new Text("Cancel"),
                  onPressed: () => Navigator.of(ctx).pop(false),
                ),
              ],
            ),
          );
        },
        onDismissed: (_) => cart.removeItem(cartItem.productId),
        background: new Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          child: new Icon(
            Icons.delete,
            size: 40,
            color: Colors.white,
          ),
          margin: EdgeInsets.all(8),
          color: Theme.of(context).errorColor,
        ),
        child: Card(
          margin: EdgeInsets.all(8),
          elevation: 4,
          child: Container(
            padding: EdgeInsets.all(10),
            child: new ListTile(
              leading: new CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FittedBox(child: new Text("${cartItem.price}/=")),
                ),
              ),
              title: new Text(cartItem.name),
              subtitle: new Text(cartItem.cost.toString()),
              trailing: new Text("${cartItem.quantity} X"),
            ),
          ),
        ));
  }
}
