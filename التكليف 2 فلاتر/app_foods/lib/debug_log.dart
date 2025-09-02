import 'dart:developer' as developer;

class DebugLog {
  static void initialize() {
    // Initialize debug logging
    developer.log('Debug logging initialized', name: 'DebugLog');
  }

  static void log(String message, {String name = 'App'}) {
    developer.log(message, name: name);
  }
}
