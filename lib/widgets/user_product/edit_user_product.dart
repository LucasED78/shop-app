import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/loading_provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/utils/form_validator.dart';
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
  Product _product = Product();
  bool _productLoaded = false;
  LoadingProvider _loadingProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageFocusNode.addListener(_displayImageUrl);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!_productLoaded) {
      final String productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _product = Provider.of<ProductsProvider>(context, listen: false).findByID(productId);
        _imageController.text = _product.imageUrl;
      }
    }

    _productLoaded = true;
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
    _loadingProvider = Provider.of<LoadingProvider>(context);

    return ShopScaffold(
      title: "Edit product",
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          onPressed: _submitForm,
        )
      ],
      body: _loadingProvider.loading ? Center(child: CircularProgressIndicator(),)
          : Padding(
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
                initialValue: _product.title ?? 'a',
                decoration: InputDecoration(
                    labelText: "title"
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_priceFocusNode),
                validator: (value) => FormValidator(value).validInput,
                onSaved: (value) => _product.title = value,
              ),
              TextFormField(
                initialValue: _product.price.toString() ?? '0',
                decoration: InputDecoration(
                    labelText: "price"
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_descriptionFocusNode),
                validator: (value) => FormValidator(value).validPrice,
                onSaved: (value) => _product.price = double.parse(value),
              ),
              TextFormField(
                initialValue: _product.description ?? '',
                decoration: InputDecoration(labelText: "description"),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                validator: (value) =>  FormValidator(value).validDescription,
                onSaved: (value) => _product.description = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "image"),
                keyboardType: TextInputType.url,
                focusNode: _imageFocusNode,
                controller: _imageController,
                validator: (value) => FormValidator(value).validImageURL,
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

  void _submitForm() async{
    final bool isValid = _form.currentState.validate();

    if (!isValid) return;

    _form.currentState.save();
    if (_product.id != null) {
      Provider.of<ProductsProvider>(context, listen: false).updateProduct(_product);
    }
    else {
      _loadingProvider.loading = true;
      await Provider.of<ProductsProvider>(context, listen: false).addProduct(_product);
      _loadingProvider.loading = false;
      Navigator.of(context).pop();
    }
  }
}
