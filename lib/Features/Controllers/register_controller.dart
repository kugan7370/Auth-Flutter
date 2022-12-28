import 'package:ecommerce_project/Features/Models/login_model.dart';
import 'package:ecommerce_project/Features/Models/register_model.dart';
import 'package:ecommerce_project/Features/Services/network_handler.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  static Future register({email, password, username, confirmPassword}) async {
    RegisterModel registerModel = RegisterModel(
        email: email,
        password: password,
        username: username,
        confirmPassword: confirmPassword);

    var registerData = await NetWorkHandler.post(
        registerModelToJson(registerModel), "/api/auth/register");

    if (registerData != null) {
      Get.snackbar('Success', 'User created Successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color.fromARGB(255, 3, 150, 15));
    }
  }
}
