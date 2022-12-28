import 'dart:convert';
import 'package:ecommerce_project/helpers/error_handling.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetWorkHandler {
  static final client = http.Client();

  static Future post(var body, String endpoint) async {
    http.Response response = await client.post(buildUrl(endpoint),
        body: body, headers: {"Content-Type": "application/json"});

    var result = await httpErrorHandling(response: response);
    if (result != null) {
      return result;
    }
  }

  static get(String endpoint) async {
    http.Response response = await client
        .get(buildUrl(endpoint), headers: {"Content-Type": "application/json"});
    var result = await httpErrorHandling(response: response);
    if (result != null) {
      return result;
    }
  }

// dotenv.env
  static Uri buildUrl(String endpoint) {
    String host = dotenv.get('APP_HOST');
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }
}
