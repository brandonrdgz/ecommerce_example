import 'package:ecommerce_example/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProduct({
    required int productId,
  });
}