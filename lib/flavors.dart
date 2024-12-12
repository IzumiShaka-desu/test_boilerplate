enum Flavor {
  dev,
  prod,
  stg,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Test Boilerplate (Dev)';
      case Flavor.prod:
        return 'Khonic Warehouse';
      case Flavor.stg:
        return 'Test Boilerplate (Stg)';
      default:
        return 'title';
    }
  }

}
