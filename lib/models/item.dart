class Item {
  final String productId;
  int quantity;

  Item({
    required this.productId,
    required this.quantity,
  });

  factory Item.fromMap(Map<String, Object> map) {
    return Item(
      productId: map['productId'] as String,
      quantity: map['quantity'] as int,
    );
  }

  Map<String, Object> toMap() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}