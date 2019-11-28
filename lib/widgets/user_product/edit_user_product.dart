import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/widgets/core/shop_scaffold.dart';

class EditUserProduct extends StatefulWidget {
  static const routeName = '/edit-products';

  @override
  _EditUserProductState createState() => _EditUserProductState();
}

class _EditUserProductState extends State<EditUserProduct> {

  final FocusNode _priceFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();
  final FocusNode _imageFocusNode = FocusNode();
  final TextEditingController _imageController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  Product _product = Product(id: DateTime.now().toString());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageFocusNode.addListener(_displayImageUrl);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _imageFocusNode.removeListener(_displayImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShopScaffold(
      title: "Edit product",
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          onPressed: _submitForm,
        )
      ],
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              _imageController.text.isEmpty ? Container() : Container(
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  width: 100,
                  height: 100,
                  imageUrl: _imageController.text,
                  fit: BoxFit.cover,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "title"
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_priceFocusNode),
                validator: (value) {
                  if (value.isEmpty) return "Please provide a value.";
                  else return null;
                },
                onSaved: (value) => _product.title = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "price"
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_descriptionFocusNode),
                onSaved: (value) => _product.price = double.parse(value),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "description"),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (value) => _product.description = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "image"),
                keyboardType: TextInputType.url,
                focusNode: _imageFocusNode,
                controller: _imageController,
                onSaved: (value) => _product.imageUrl = value,
                onFieldSubmitted: (_) => _submitForm(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _displayImageUrl(){
    if (!_imageFocusNode.hasFocus) {
      setState(() {

      });
    }
  }

  void _submitForm(){
    final bool isValid = _form.currentState.validate();

    if (!isValid) return;

    _form.currentState.save();
    print(_product.title);
  }
}
