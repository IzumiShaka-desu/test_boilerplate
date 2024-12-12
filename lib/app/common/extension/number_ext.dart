extension NumberExt on num {
  String get asRp {
    return 'Rp. ${toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')},-';
  }

  /// Converts a double value to a [Duration] with millisecond and microsecond precision.
  ///
  /// The integral part of the double value is treated as milliseconds, and the decimal
  /// part is treated as microseconds. For example:
  ///   - If the double value is 5.5, the resulting [Duration] will be 5 milliseconds
  ///     and 500 microseconds.
  ///   - If the double value is 5.0, the resulting [Duration] will be 5 milliseconds.
  ///
  /// Example:
  /// ```dart
  /// final result = 5.5.ms;
  /// print(result); // Output: 5 milliseconds, 500 microseconds
  /// Returns a [Duration] object representing the converted value.
  Duration get ms {
    // if is 5.5 then 5 milliseconds and 500 microseconds and if is 5 then 5 milliseconds
    final milliseconds = toInt();
    final microseconds = ((this - milliseconds) * 1000).toInt();
    return Duration(milliseconds: milliseconds, microseconds: microseconds);
  }

  /// Converts a double value to a [Duration] in seconds and milliseconds.
  ///
  /// The method extracts the whole seconds and milliseconds from the double value.
  /// For example, if the input is 5.5, the resulting [Duration] will be 5 seconds
  /// and 500 milliseconds. If the input is 5, the resulting [Duration] will be
  /// 5 seconds.
  /// Example:
  /// ```dart
  /// final result = 5.5.seconds;
  /// print(result); // Output: 5 seconds, 500 milliseconds
  /// Returns a [Duration] representing the seconds and milliseconds of the input.
  Duration get seconds {
    // if is 5.5 then 5 seconds and 500 milliseconds and if is 5 then 5 seconds
    final seconds = toInt();
    final milliseconds = ((this - seconds) * 1000).toInt();
    return Duration(seconds: seconds, milliseconds: milliseconds);
  }

  /// Converts a double value to a [Duration] object representing minutes and seconds.
  ///
  /// For example, if the value is 5.5, the returned [Duration] will represent
  /// 5 minutes and 30 seconds. If the value is 5.0, the returned [Duration] will
  /// represent 5 minutes with 0 seconds.
  ///
  /// Example:
  /// ```dart
  /// final result = 5.5.minutes;
  /// print(result); // Output: 5 minutes, 30 seconds
  /// ```
  /// Returns a [Duration] object based on the integer part as minutes and
  /// the fractional part as seconds.
  Duration get minutes {
    // if is 5.5 then 5 minutes and 30 seconds and if is 5 then 5 minutes
    final minutes = toInt();
    final seconds = ((this - minutes) * 60).toInt();
    return Duration(minutes: minutes, seconds: seconds);
  }

  /// Converts a decimal representation of time to a [Duration] object.
  ///
  /// The decimal representation is interpreted as follows:
  ///   - The whole part represents hours.
  ///   - The decimal part represents the minutes.
  ///   - The fractional part of the decimal represents the seconds.
  ///
  /// Example:
  ///   - If the decimal is 5.5, it is interpreted as 5 hours and 30 minutes.
  ///   - If the decimal is 5, it is interpreted as 5 hours.
  ///
  /// Example:
  /// ```dart
  /// final result = 5.5.hours;
  /// print(result); // Output: 5 hours, 30 minutes
  /// ```
  /// Returns a [Duration] object representing the converted time.
  Duration get hours {
    // if is 5.5 then 5 hours and 30 minutes and if is 5 then 5 hours
    final hours = toInt();
    final minutes = ((this - hours) * 60).toInt();
    final seconds = ((this - hours - (minutes / 60)) * 60).toInt();
    return Duration(
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
  }

  /// Converts a duration to days, hours, minutes, and seconds.
  ///
  /// The method takes a [Duration] and calculates the equivalent duration in
  /// days, hours, minutes, and seconds. It returns a [Duration] object
  /// representing the breakdown.
  ///
  /// Example:
  /// ```dart
  /// final result = 5.5.days;
  /// print(result); // Output: 5 days, 12 hours
  /// ```
  Duration get days {
    // if is 5.5 then 5 days and 12 hours and if is 5 then 5 days
    final days = toInt();
    final hours = ((this - days) * 24).toInt();
    final minutes = ((this - days - (hours / 24)) * 60).toInt();
    final seconds =
        ((this - days - (hours / 24) - (minutes / 1440)) * 60).toInt();
    return Duration(
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
  }
}
