import 'package:flutter/material.dart';
import 'package:shop_app/models/user.dart';
import 'package:shop_app/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  User _user;
  bool _isAuthenticated;
  String _tokenExpireIn;

  set user (data){
    _user = User.fromJSON(data);
    notifyListeners();
  }

  get user => _user;

  set isAuthenticated (bool auth){
    _isAuthenticated = auth;
    notifyListeners();
  }

  set tokenExpirationTime(String exp){
    _tokenExpireIn = exp;
    notifyListeners();
  }

  get tokenExpirationTime => _tokenExpireIn;

  get isAuthenticated => _isAuthenticated;

  Future<void> signup(User user) async{
    final response = await AuthService().signup(user.email, user.password);

    user.id = response['localId'];
    _user = user;
    _isAuthenticated = true;
    _tokenExpireIn = response['expiresIn'];

    print(_user.toJSON());
    print(_isAuthenticated);
    print(_tokenExpireIn);
  }
}