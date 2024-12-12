abstract class AppConfig {
  static const String baseUrl =
      String.fromEnvironment('BASE_URL', defaultValue: 'https://khonic-api.azurewebsites.net/api/v1/warehouse-app');
  static const String appVersion = String.fromEnvironment('APP_VERSION ', defaultValue: 'dev');
}
