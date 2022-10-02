import 'package:ecommerce_example/api/order_api.dart';
import 'package:ecommerce_example/models/order.dart';
import 'package:ecommerce_example/repositories/base_http_repository.dart';
import 'package:ecommerce_example/repositories/order_repository.dart';
import 'package:ecommerce_example/util/http_util.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

class HttpOrderRepository extends BaseHttpRepository implements OrderRepository {
  final OrderApi api;

  HttpOrderRepository({
    required this.api,
    required super.client,
  });

  @override
  Future<Order> getOrder({required int orderId}) {
    return getData<Order, Map<String, Object>>(
      httpMethod: HttpMethod.get,
      uri: api.order(orderId: orderId),
      builder: (map) => Order.fromMap(map),
    );
  }

  @override
  Future<List<Order>> getOrders() {
    return getData<List<Order>, List<Map<String, Object>>>(
      httpMethod: HttpMethod.get,
      uri: api.orders(),
      builder: (orders) => orders.map<Order>(
        (order) => Order.fromMap(order)
      ).toList(),
    );
  }
}

final orderRepositoryProvider = Provider<OrderRepository>(
  (ref) => HttpOrderRepository(
    api: OrderApi(),
    client: http.Client(), 
  ),
);