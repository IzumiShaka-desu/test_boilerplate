import 'dart:ui';

sealed class OrderTypeDetail {
  String get name;
  Color get foregroundColor;
  Color get backgroundColor;
}

enum OrderType implements OrderTypeDetail {
  warehouse(
    name: 'Warehouse',
    foregroundColor: Color(0xFFFFF6E6),
    backgroundColor: Color(0xFFA98D58),
  ),
  generalTrade(
    name: 'General Trade',
    foregroundColor: Color(0xFFD1EEE1),
    backgroundColor: Color(0xFF1BAA69),
  );

  const OrderType({
    required this.name,
    required this.foregroundColor,
    required this.backgroundColor,
  });
  @override
  final String name;
  @override
  final Color foregroundColor;
  @override
  final Color backgroundColor;
}

OrderType orderTypeFromString(String type) {
  switch (type.toLowerCase()) {
    case 'general trade':
      return OrderType.generalTrade;
    case 'warehouse':
      return OrderType.warehouse;
    default:
      throw Exception('Unknown type: $type');
  }
}
