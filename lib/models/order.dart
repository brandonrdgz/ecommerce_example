import 'package:ecommerce_example/models/item.dart';

class Order {
  final String id;
  final String userId;
  final List<Item> items;
  final status;
  final String date;
  final double total;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.status,
    required this.date,
    required this.total,
  });

  factory Order.fromMap(Map<String, Object> map) {
    return Order(
      id: map['id'] as String,
      userId: map['userId'] as String,
      items: (map['items'] as List<Map<String, Object>>).map((item) => Item.fromMap(item)).toList(),
      status: map['status'],
      date: map['date'] as String,
      total: map['total'] as double,
    );
  }

  Map<String, Object> toMap() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => item.toMap()).toList(),
      'status': status,
      'date': date,
      'total': total,
    };
  }
}