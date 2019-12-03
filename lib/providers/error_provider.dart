import 'package:flutter/foundation.dart';

class ErrorProvider with ChangeNotifier {
  String _error;

  set error (String error){
    _error = error;
    notifyListeners();
  }

  get error => _error;
}