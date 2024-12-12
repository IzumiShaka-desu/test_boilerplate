enum AppVersion { dev, staging, production }

extension AppVersionExtension on AppVersion {
  String get name {
    switch (this) {
      case AppVersion.dev:
        return 'dev';
      case AppVersion.staging:
        return 'staging';
      case AppVersion.production:
        return 'production';
      default:
        return 'dev';
    }
  }

  AppVersion fromString(String version) {
    switch (version) {
      case 'dev':
        return AppVersion.dev;
      case 'staging':
        return AppVersion.staging;
      case 'production':
        return AppVersion.production;
      default:
        return AppVersion.dev;
    }
  }
}

AppVersion appVersionFromString(String version) {
  switch (version) {
    case 'dev':
      return AppVersion.dev;
    case 'staging':
      return AppVersion.staging;
    case 'production':
      return AppVersion.production;
    default:
      return AppVersion.dev;
  }
}
