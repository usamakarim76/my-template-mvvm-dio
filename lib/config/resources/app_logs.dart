import 'dart:developer';

class AppLogs {
  static void errorLog(String message) {
    log("\x1B[31m$message");
  }

  static void successLog(String message) {
    log("\x1B[32m$message");
  }

  static void warningLog(String message) {
    log("\x1B[33m$message");
  }

  static void whiteLog(String message) {
    log("\x1B[37m$message");
  }
}
