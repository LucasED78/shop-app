import 'package:flutter/material.dart';
import 'package:shop_app/widgets/core/shop_scaffold.dart';

class EditUserProduct extends StatefulWidget {
  static const routeName = '/edit-products';

  @override
  _EditUserProductState createState() => _EditUserProductState();
}

class _EditUserProductState extends State<EditUserProduct> {

  final FocusNode _priceFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ShopScaffold(
      title: "Edit product",
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: "title"
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_priceFocusNode),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "price"
                ),
                textInputAction: TextInputAction.next,
                focusNode: _priceFocusNode,
              )
            ],
          ),
        ),
      ),
    );
  }
}
