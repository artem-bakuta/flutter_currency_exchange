import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/base_request_model.dart';

class ApiClient {
  String baseUrl;

  var headers = {
    'content-type': 'application/json; charset=UTF-8',
    'api-key': '795cfec4-68b1-42d6-baa0-16a53ce09a1d'
  };

  ApiClient(this.baseUrl);

  Future<Response> post<T extends BaseRequestModel>(
      String endpoint, T params) async {
    var uri = Uri.parse(baseUrl + endpoint);
    var body = json.encode(params.toJson());
    var response = http.post(uri, headers: headers, body: body);
    return await response;
  }

  Future<Response> get(String endpoint) {
    return http.get(headers: headers, Uri.parse(baseUrl + endpoint));
  }
}
