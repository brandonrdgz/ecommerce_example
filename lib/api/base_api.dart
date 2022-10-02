import 'package:flutter/foundation.dart';

class BaseApi {
  static const String _apiBaseUrl = "localhost:8000";
  //static const String _apiBaseUrl = "192.168.0.106:8080";
  static const String _apiPath = "/api/";

  @protected Uri buildUri({
    required String endpoint,
  }) {
    return Uri(
      scheme: "http",
      host: _apiBaseUrl,
      path: "$_apiPath$endpoint",
    );
  }
}