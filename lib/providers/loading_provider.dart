import 'package:flutter/material.dart';

class LoadingProvider with ChangeNotifier {
  bool _loading = false;

  set loading (bool loading){
    _loading = loading;
    notifyListeners();
  }

  get loading => _loading;
}