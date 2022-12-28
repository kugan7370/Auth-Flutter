import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

httpErrorHandling({required http.Response response}) async {
  switch (response.statusCode) {
    case 200:
      return response.body;
    case 201:
      return response.body;
    case 400:
      sendSnackBark(
          messageType: "Error", message: jsonDecode(response.body)['message']);
      break;
    case 404:
      sendSnackBark(
          messageType: "Error", message: jsonDecode(response.body)['message']);
      break;
    case 422:
      sendSnackBark(
          messageType: "Error", message: jsonDecode(response.body)['message']);
      break;
    case 500:
      sendSnackBark(
          messageType: "Sever Error",
          message: jsonDecode(response.body)['message']);
      break;
    default:
      sendSnackBark(
          messageType: "Error", message: jsonDecode(response.body)['message']);
      break;
  }
}

sendSnackBark({required messageType, required message}) {
  Get.snackbar(messageType, message,
      snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
}
