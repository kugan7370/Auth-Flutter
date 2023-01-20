import 'dart:convert';

import 'package:ecommerce_project/helpers/error_handling.dart';
import 'package:ecommerce_project/helpers/get_token.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  // late String token;

  final http.Client client = http.Client();

  //create header

  // dotenv.env
  static Uri buildUrl(String endpoint) {
    String host = dotenv.get('APP_HOST');
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  Future getData(String uri) async {
    var token = await getToken();
    try {
      http.Response response = await client.get(buildUrl(uri), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": 'Bearer $token'
      });
      var result = await httpErrorHandling(response: response);
      if (result != null) {
        return result;
      }
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future postData(String uri, data) async {
    var token = await getToken();
    print(token);
    try {
      http.Response response =
          await client.post(buildUrl(uri), body: json.encode(data), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": 'Bearer $token'
      });
      var result = await httpErrorHandling(response: response);
      if (result != null) {
        return result;
      }
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
