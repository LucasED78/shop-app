class AsyncUtils {
  static Future<void> delayState() {
    return Future.delayed(Duration(seconds: 1));
  }
}