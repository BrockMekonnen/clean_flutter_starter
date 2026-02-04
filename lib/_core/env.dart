class Env {
  /// Example:
  /// http://127.0.0.1:9090/api

  static final String apiBase = const String.fromEnvironment(
    'API_BASE',
    defaultValue: 'http://127.0.0.1:9090/api',
  );
}
