class AsyncUtils {
  static delayState(Function fn) {
    return Future.delayed(Duration(seconds: 0), fn);
  }
}