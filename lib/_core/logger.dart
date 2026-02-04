import 'package:logger/logger.dart';

import 'di.dart';

class Log {
  static void init({bool isDebug = true}) {
    final logger = Logger(
      level: isDebug ? Level.debug : Level.warning,
      printer: PrettyPrinter(
        methodCount: 2, // Number of stack trace lines to show
        errorMethodCount: 5, // Number of stack trace lines for errors
        lineLength: 80, // Max line length
        colors: true, // Colorful log output (works in debug console)
        printEmojis: true, // Add emojis for log levels
        printTime: false, // Add time stamps to log output
      ),
    );

    di.registerSingleton<Logger>(logger);
  }

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      di<Logger>().d(message, error: error, stackTrace: stackTrace);

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      di<Logger>().i(message, error: error, stackTrace: stackTrace);

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      di<Logger>().w(message, error: error, stackTrace: stackTrace);

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      di<Logger>().e(message, error: error, stackTrace: stackTrace);
}
