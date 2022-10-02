import 'package:ecommerce_example/api/product_api.dart';
import 'package:ecommerce_example/models/product.dart';
import 'package:ecommerce_example/repositories/base_http_repository.dart';
import 'package:ecommerce_example/repositories/product_repository.dart';
import 'package:ecommerce_example/util/http_util.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

class HttpProductRepository extends BaseHttpRepository implements ProductRepository {
  final ProductApi api;

  HttpProductRepository({
    required this.api,
    required super.client
  });

  @override
  Future<Product> getProduct({required int productId}) {
    return getData<Product, Map<String, Object>>(
      httpMethod: HttpMethod.get,
      uri: api.product(productId: productId),
      builder: (map) => Product.fromMap(map),
    );
  }

  @override
  Future<List<Product>> getProducts() {
    return getData<List<Product>, List<Map<String, Object>>>(
      httpMethod: HttpMethod.get,
      uri: api.products(),
      builder: (products) => products.map<Product>(
        (product) => Product.fromMap(product)
      ).toList()
    );
  }
}

final productRepositoryProvider = Provider<ProductRepository>(
  (ref) => HttpProductRepository(
    api: ProductApi(),
    client: http.Client(),
  ),
);