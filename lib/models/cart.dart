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

extension MutableCart on Cart {
  Cart addItem({
    required String productId,
    required int quantity,
  }) {
    final itemsCopy = List<Item>.from(items);
    Item item = itemsCopy.singleWhere(
      (element) => element.productId == productId,
      orElse: () => Item(productId: productId, quantity: 0),
    );

    item.quantity += quantity;
    itemsCopy.removeWhere((element) => element.productId == productId);
    itemsCopy.add(item);

    return Cart(
      items: itemsCopy,
      total: total,
    );
  }

  Cart removeItemById(String productId) {
    final itemsCopy = List<Item>.from(items);
    
    itemsCopy.removeWhere((item) => item.productId == productId);

    return Cart(
      items: itemsCopy,
      total: total,
    );
  }
}