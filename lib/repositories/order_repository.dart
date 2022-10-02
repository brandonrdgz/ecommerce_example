import 'package:ecommerce_example/models/order.dart';
abstract class OrderRepository {
  Future<List<Order>> getOrders();
  Future<Order> getOrder({
    required int orderId,
  });
}