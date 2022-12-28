import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ecommerce_project/Features/Models/login_model.dart';
import 'package:ecommerce_project/Features/Services/network_handler.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static Future login({email, password}) async {
    LoginModel loginModel = LoginModel(email: email, password: password);

    var loginresult = await NetWorkHandler.post(
        loginModelToJson(loginModel), "/api/auth/login");

    if (loginresult != null) {
      print(loginresult);
      var data = json.decode(loginresult);

      Get.snackbar('Success', 'User login Successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color.fromARGB(255, 3, 150, 15));
    }
  }
}
