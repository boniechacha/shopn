import 'package:flutter/material.dart';

class ProductEditor extends StatefulWidget {
  static const ROUTE = "/product-editor";

  @override
  _ProductEditorState createState() => _ProductEditorState();
}

class _ProductEditorState extends State<ProductEditor> {
  final priceFocusNode = new FocusNode();
  final descriptionFocusNode = new FocusNode();
  final imageUrlFocusNode = new FocusNode();

  final imageUrlController = new TextEditingController();

  void _showImagePreview() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();

    priceFocusNode.dispose();
    descriptionFocusNode.dispose();
    imageUrlController.dispose();

    imageUrlController.removeListener(_showImagePreview);
  }

  @override
  void initState() {
    super.initState();

    imageUrlFocusNode.addListener(_showImagePreview);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Edit Product"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          child: new Column(
            children: [
              new TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(priceFocusNode),
              ),
              new TextFormField(
                decoration: InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: priceFocusNode,
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(descriptionFocusNode),
              ),
              new TextFormField(
                decoration: InputDecoration(labelText: "Description"),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: descriptionFocusNode,
              ),
              new Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  new Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(top: 10, right: 10),
                    decoration: new BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: imageUrlController.text.isEmpty
                        ? new Text("Enter URL")
                        : FittedBox(
                            child: Image.network(imageUrlController.text),
                            fit: BoxFit.cover,
                          ),
                  ),
                  new Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Image URL"),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      focusNode: imageUrlFocusNode,
                      controller: imageUrlController,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
