import 'package:dio/dio.dart';
import 'package:shop_app/widgets/core/security/security_keys.dart';

class AuthService {
  Future<Map> signup(String email, String password) async{
   String _firebaseKey = await SecurityKeys().readKey("FIREBASE_API");

   Response response = await Dio().post(
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseKey",
      data: { "email": email, "password": password, "returnSecureToken": true }
    ).catchError((e) => print(e.response));

   return response.data;
  }
  
  Future<Map> login(String email, String password) async{
    String _firebaseKey = await SecurityKeys().readKey("FIREBASE_API");

    Response response = await Dio().post(
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseKey",
      data: { "email": email, "password": password, "returnSecureToken": true }
    );

    return response.data;
  }
}