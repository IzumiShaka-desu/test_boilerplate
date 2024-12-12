final List<String> _monthNames = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember',
];

extension DtimeExt on DateTime {
  /// Formats the date and time components into a string.
  ///
  /// Returns a formatted string representing the date and time in the format:
  /// 'hh:mm dd/mm/yyyy', where
  ///   - 'hh' is the two-digit hour,
  ///   - 'mm' is the two-digit minute,
  ///   - 'dd' is the two-digit day,
  ///   - 'mm' is the two-digit month, and
  ///   - 'yyyy' is the four-digit year.
  ///
  /// Example:
  ///   If hour = 9, minute = 30, day = 15, month = 6, and year = 2022,
  ///   the returned string will be '09:30 15/06/2022'.
  ///
  /// Note: The 'padLeft' method is used to ensure two-digit formatting.
  String get stringify {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} ${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${year.toString().padLeft(2, '0')}';
  }

  /// format the date to string
  ///  Returns a formated string representing the date in the format:
  /// 'dd-mm-yyyy', where
  ///  - 'dd' is the two-digit day,
  /// - 'mm' is the two-digit month, and
  /// - 'yyyy' is the four-digit year.
  /// Example:
  ///  If day = 15, month = 6, and year = 2022,
  /// the returned string will be '15-06-2022'.
  /// Note: The 'padLeft' method is used to ensure two-digit formatting.
  ///
  String get dateString {
    return '${day.toString().padLeft(2, '0')}-${month.toString().padLeft(2, '0')}-${year.toString().padLeft(2, '0')}';
  }

  // format the date to string
  // 21 Agustus 2024
  String get idDateString {
    return '${day.toString().padLeft(2, '0')} ${_monthNames[month - 1]} $year';
  }
}
