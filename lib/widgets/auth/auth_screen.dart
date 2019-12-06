import 'package:flutter/material.dart';
import 'package:shop_app/widgets/auth/auth_card.dart';
import 'package:shop_app/widgets/core/login_scaffold.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return LoginScaffold(
      body: Container(
        width: deviceSize.width,
        height: deviceSize.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: deviceSize.width * 0.5,
              alignment: Alignment.center,
              height: deviceSize.height * 0.1,
              transform: Matrix4.rotationZ(-50.0),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                "SHOP",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Anton",
                ),
              ),
            ),
            AuthCard()
          ],
        ),
      ),
    );
  }
}