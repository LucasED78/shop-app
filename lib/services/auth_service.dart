import 'package:dio/dio.dart';
import 'package:shop_app/models/user.dart';

class AuthService {
Future<Map> signup(String email, String password) async{
   Response response = await Dio().post(
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDO65wTCTy9uBxOdNbYl-_GkNRQYsugEOk",
      data: { "email": email, "password": password, "returnSecureToken": true }
    );

   return response.data;
  }
}