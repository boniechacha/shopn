import 'package:flutter/material.dart';
import 'package:shop_app/provider/product.dart';

class ProductListItem extends StatelessWidget {
  final Product product;

  ProductListItem(this.product);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      subtitle: Text(
        product.description,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Container(
        width: 100,
        child: new Row(
          children: [
            new IconButton(icon: Icon(Icons.edit), onPressed: () {}),
            new IconButton(icon: Icon(Icons.delete), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
