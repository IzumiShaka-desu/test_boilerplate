extension StringExtension on String {
  /// Checks if the current string represents a valid email address.
  ///
  /// Returns `true` if the string adheres to the standard email format:
  ///   - Contains one or more alphanumeric characters and dots before the "@" symbol.
  ///   - Contains one or more alphanumeric characters after the "@" symbol.
  ///   - Contains a dot followed by one or more alphanumeric characters after the "@" symbol.
  ///
  /// Returns `false` if the string does not meet the specified email format.
  bool get isValidEmail {
    RegExp regExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regExp.hasMatch(trim());
  }

  /// Returns a capitalized version of the string.
  ///
  /// If the string is empty, an empty string is returned.
  /// Otherwise, the first character of the string is capitalized.
  ///
  /// Example:
  /// ```dart
  /// String result = "hello".capitalized; // Returns "Hello"
  /// ```
  String get capitalized {
    if (isEmpty) return "";
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

/// Fills the given [string] with a specified [fillString] to achieve a minimum [maxLength].
///
/// If the length of the input [string] is already greater than or equal to [maxLength],
/// the original string is returned as is. Otherwise, the [string] is prefixed with enough
/// instances of [fillString] to meet the minimum [maxLength].
///
/// Example:
/// ```dart
/// String result = fillStringWith("42", fillString: "0", maxLength: 5);
/// print(result); // Output: "00042"
/// ```
///
/// Parameters:
///   - [string]: The input string to be filled.
///   - [fillString]: The string used for filling. Default is "0".
///   - [maxLength]: The minimum length of the resulting string. Default is 3.
///
/// Returns the modified string based on the specified conditions.
String fillStringWith(
  String string, {
  String fillString = "0",
  int maxLength = 3,
}) {
  if (string.length >= maxLength) return string;
  final diff = maxLength - string.length;
  return "${fillString * diff}$string";
}
