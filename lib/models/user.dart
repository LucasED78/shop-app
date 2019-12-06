import 'package:flutter/cupertino.dart';

class User {
  String id;
  String email;
  String password;

  User({
    @required this.id,
    @required this.email,
    @required this.password,
  });

  factory User.fromJSON(dynamic data){
    return User(
      id: data['localId'],
      email: data['email'],
      password: data['password']
    );
  }

  toJSON(){
    return {
      "email": email,
      "password": password
    };
  }
}