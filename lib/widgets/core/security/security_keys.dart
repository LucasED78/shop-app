import 'package:shop_app/widgets/core/security/security_storage.dart';

class SecurityKeys extends SecurityStorage{
  @override
  void setInitialConfig(Map<String, String> configKeys) {
    // TODO: implement setInitialConfig
    super.setInitialConfig(configKeys);

    configKeys.forEach((k, v) async{
      if (await readKey(k) == '') {
        writeKey(k, v);
        print("teste");
      }
    });
  }
}