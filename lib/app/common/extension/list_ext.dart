extension ListExt<T> on List<T> {
  Map<T, U> asMapKey<U>(U Function(T) value) {
    return Map.fromEntries(map((e) => MapEntry(e, value(e))));
  }

  T? firstWhereOrNull(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}
