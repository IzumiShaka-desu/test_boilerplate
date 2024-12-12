enum SortBy {
  none,
  newest,
  oldest,
}

SortBy fromString(String value) {
  switch (value) {
    case "newest":
      return SortBy.newest;
    case "oldest":
      return SortBy.oldest;
    default:
      return SortBy.none;
  }
}

extension SortByExt on SortBy {
  String get query {
    switch (this) {
      case SortBy.newest:
        return "order_date,desc";
      case SortBy.oldest:
        return "order_date,asc";

      case SortBy.none:
      default:
        return "";
    }
  }

  String get returnQuery {
    switch (this) {
      case SortBy.newest:
        return "return_date,desc";
      case SortBy.oldest:
        return "return_date,asc";

      case SortBy.none:
      default:
        return "";
    }
  }

  String get displayString {
    switch (this) {
      case SortBy.newest:
        return "Terbaru";
      case SortBy.oldest:
        return "Terlama";
      case SortBy.none:
      default:
        return "Urutkan";
    }
  }
}
