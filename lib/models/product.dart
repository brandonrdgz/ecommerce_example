class Product {
  final String id;
  final String imageUrl;
  final String title;
  final double price;
  final int availableQuantity;

  Product({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.availableQuantity,
  });

  factory Product.fromMap(Map<String, Object> map) {
    return Product(
      id: map['id'] as String,
      imageUrl: map['imageUrl'] as String,
      title: map['title'] as String,
      price: map['price'] as double,
      availableQuantity: map['availableQuantity'] as int,
    );
  }

  Map<String, Object> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'price': price,
      'availableQuantity': availableQuantity,
    };
  }
}