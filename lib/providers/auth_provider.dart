import 'package:flutter/material.dart';
import 'package:shop_app/models/user.dart';
import 'package:shop_app/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  User _user;
  bool _isAuthenticated;
  String _tokenExpireIn;

  get user => _user;

  get tokenExpirationTime => _tokenExpireIn;

  get isAuthenticated => _isAuthenticated;

  Future<void> signup(User user) async{
    final response = await AuthService().signup(user.email, user.password);

    user.id = response['localId'];

    _setUserData(authenticated: true, tokenExp: response['expiresIn'], user: user);

    _user = user;
    _isAuthenticated = true;
    _tokenExpireIn = response['expiresIn'];
  }

  Future<void> signIn(User user) async {
    final response = await AuthService().login(user.email, user.password);

    user.id = response['localId'];

    _setUserData(authenticated: true, tokenExp: response['expiresIn'], user: user);

    print(_user.toJSON());
    print(_isAuthenticated);
    print(_tokenExpireIn);
  }

  _setUserData({ @required bool authenticated, @required String tokenExp, @required User user}) {
    _isAuthenticated = authenticated;
    _tokenExpireIn = tokenExp;
    _user = user;

    notifyListeners();
  }
}