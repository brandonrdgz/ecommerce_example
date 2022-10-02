import 'dart:convert';

import 'package:ecommerce_example/util/http_util.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BaseHttpRepository {
  final http.Client client;

  @protected BaseHttpRepository({
    required this.client,
  });

  @protected Future<T> getData<T, T1>({
    required HttpMethod httpMethod,
    required Uri uri,
    required T Function(T1 data) builder,
  }) async {
    final http.Response response = await HttpUtil.makeRequest(
      client: client,
      httpMethod: httpMethod,
      uri: uri
    );
    final data = json.decode(response.body);

    return builder(data.responseObject);
  }
}