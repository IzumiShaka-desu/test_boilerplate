class PageWrapper<T> {
  final int totalData;
  final int totalPages;
  final int pageSize;
  final int currentPage;
  final int currentTotalData;
  final List<T> data;
  final String? error;

  PageWrapper({
    required this.totalData,
    required this.totalPages,
    required this.pageSize,
    required this.currentPage,
    required this.currentTotalData,
    required this.data,
    required this.error,
  });
}
