import 'package:ecommerce_example/api/base_api.dart';

class ProductApi extends BaseApi {
  Uri products() {
    return buildUri(
      endpoint: "products",
    );
  }

  Uri product({
    required int productId,
  }) {
    return buildUri(
      endpoint: "products/$productId"
    );
  }
}