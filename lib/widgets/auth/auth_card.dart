import 'package:flutter/material.dart';

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
                  controller: _passwordController,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "password"
                  ),
                  textInputAction: _mode == AuthMode.LOGIN ? TextInputAction.done : TextInputAction.next,
                  onFieldSubmitted: (_){
                    if (_mode == AuthMode.LOGIN) {
                      //login
                    }
                    else _confirmPassFocusNode.requestFocus();
                  },
                ),
                const SizedBox(height: 10,),
                if (_mode == AuthMode.SIGNUP)
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "confirm password",
                    ),
                    focusNode: _confirmPassFocusNode,
                    validator: (v) {
                      if (v != _passwordController) return "password dont match";
                      return null;
                    },
                  ),
                const SizedBox(height: 10,),
                RaisedButton(
                  child: Text("LOGIN"),
                  onPressed: () => {},
                ),
                const SizedBox(height: 10,),
                FlatButton(
                  child: Text(
                      "${_mode == AuthMode.LOGIN ? "SIGNUP" : "LOGIN"} INSTEAD"
                  ),
                  onPressed: _switchMode,
                )
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
}
