import 'package:ecommerce_example/api/base_api.dart';

class OrderApi extends BaseApi {
  Uri orders() {
    return buildUri(
      endpoint: "orders",
    );
  }

  Uri order({
    required int orderId,
  }) {
    return buildUri(
      endpoint: "order/$orderId",
    );
  }
}