
class Paging<T> {
  final int totalData;
  final int totalPages;
  final int pageSize;
  final int currentPage;
  final int currentTotalData;
  final List<T>? data;
  final String? error;

  Paging({
    required this.totalData,
    required this.totalPages,
    required this.pageSize,
    required this.currentPage,
    required this.currentTotalData,
    required this.data,
    this.error,
  });

  factory Paging.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJson) {
    return Paging(
      totalData: json['totalData'],
      totalPages: json['totalPages'],
      pageSize: json['pageSize'],
      currentPage: json['currentPage'],
      currentTotalData: json['currentTotalData'],
      data: json['data'] == null ? null : List<T>.from(json['data'].map((x) => fromJson(x))),
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() => {
        'totalData': totalData,
        'totalPages': totalPages,
        'pageSize': pageSize,
        'currentPage': currentPage,
        'currentTotalData': currentTotalData,
        'data': data == null ? null : List<dynamic>.from(data!.map((x) => x)),
        'error': error,
      };
}
