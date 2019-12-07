import 'package:shop_app/widgets/core/constants.dart';
import 'package:shop_app/widgets/core/security/security_keys.dart';

class Keys {
  static setKeys() {
    SecurityKeys().setInitialConfig({
      "FIREBASE_API": CONSTANTS.FIREBASE_API
    });
  }
}