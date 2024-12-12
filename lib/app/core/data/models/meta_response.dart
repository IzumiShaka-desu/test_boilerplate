class MetaResponse<T> {
  final int statusCode;
  final String timestamp;
  final bool success;
  final String? message;
  final T data;
  final String? error;

  MetaResponse({
    required this.statusCode,
    required this.timestamp,
    required this.success,
    required this.message,
    required this.data,
    required this.error,
  });

  MetaResponse copyWith({
    int? statusCode,
    String? timestamp,
    bool? success,
    String? message,
    List<T>? data,
    String? error,
  }) =>
      MetaResponse(
        statusCode: statusCode ?? this.statusCode,
        timestamp: timestamp ?? this.timestamp,
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
        error: error ?? this.error,
      );

  factory MetaResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) dataMapper,
  ) =>
      MetaResponse(
        statusCode: json["status_code"],
        timestamp: json["timestamp"],
        success: json["success"],
        message: json["message"],
        data: dataMapper(json["data"]),
        error: json["error"],
      );
}
