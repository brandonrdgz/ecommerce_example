import 'package:ecommerce_example/models/item.dart';

class Cart {
  final List<Item> items;
  final double total;

  Cart({
    required this.items,
    required this.total,
  });

  factory Cart.fromMap(Map<String, Object> map) {
    return Cart(
      items: (map['items'] as List<Map<String, Object>>)
        .map((item) => Item.fromMap(item))
        .toList(),
      total: map['total'] as double,
    );
  }

  Map<String, Object> toMap() {
    return {
      'items': items.map((item) => item.toMap()).toList(),
      'total': total,
    };
  }
}