import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecurityStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> writeKey(String key, String value) async{
    return await _storage.write(key: key, value: value);
  }

  Future readKey(String key) async{
    return await _storage.read(key: key);
  }

  void setInitialConfig(Map<String, String> configKeys) {
    return configKeys.forEach((k, v) async{
      await this.writeKey(k, v);
    });
  }
}