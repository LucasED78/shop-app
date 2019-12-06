import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/user.dart';
import 'package:shop_app/providers/auth_provider.dart';
import 'package:shop_app/widgets/core/widgets/button_with_loading.dart';

enum AuthMode { LOGIN, SIGNUP }

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _confirmPassFocusNode = FocusNode();
  AuthMode _mode = AuthMode.LOGIN;
  bool _loading = false;
  User _user = User();
  AuthProvider _authProvider;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _passwordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPassFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Email"
                  ),
                  validator: (value){
                    if (!value.contains("@")) return "invalid email";
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
                  onSaved: (v) => _user.email = v,
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "password"
                  ),
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  textInputAction: _mode == AuthMode.LOGIN ? TextInputAction.done : TextInputAction.next,
                  onFieldSubmitted: (_){
                    if (_mode == AuthMode.LOGIN) {
                      //login
                    }
                    else _confirmPassFocusNode.requestFocus();
                  },
                  onSaved: (v) => _user.password = v,
                ),
                const SizedBox(height: 10,),
                if (_mode == AuthMode.SIGNUP)
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "confirm password",
                    ),
                    focusNode: _confirmPassFocusNode,
                    validator: (v) {
                      if (v != _passwordController.text) return "password dont match";
                      return null;
                    },
                    onFieldSubmitted: (_) => _submit(),
                  ),
                const SizedBox(height: 10,),
                Container(
                  width: size.width * 0.4,
                  height: size.height * 0.06,
                  child: ButtonWithLoading(
                    text: "${ _mode == AuthMode.LOGIN ? "LOGIN" : "SIGNUP" }",
                    isLoading: _loading,
                    onPressed: _submit,
                  ),
                ),
                const SizedBox(height: 10,),
                FlatButton(
                  child: Text(
                    "${_mode == AuthMode.LOGIN ? "SIGNUP" : "LOGIN"} INSTEAD",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: _switchMode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _switchMode() {
    if (_mode == AuthMode.LOGIN) {
      setState(() {
        _mode = AuthMode.SIGNUP;
      });
    }
    else setState(() {
      _mode = AuthMode.LOGIN;
    });
  }

  void _submit() async{
    if (_formKey.currentState.validate()){
      if (_mode == AuthMode.LOGIN) {

      }else {
        setState(() {
          _loading = true;
        });
        _formKey.currentState.save();
        await _authProvider.signup(_user);
        setState(() {
          _loading = false;
        });
      }
    }
  }
}
