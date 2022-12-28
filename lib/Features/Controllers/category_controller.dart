import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ecommerce_project/Features/Models/login_model.dart';
import 'package:ecommerce_project/Features/Services/network_handler.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static getCategory({email, password}) async {
    var result = await NetWorkHandler.get("/api/admin/getcategory");

    if (result != null) {
      var data = json.decode(result);
      Get.snackbar('Success', 'data feched',
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color.fromARGB(255, 3, 150, 15));
      return data;
    }
  }
}
