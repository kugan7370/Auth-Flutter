import 'dart:convert';

import 'package:ecommerce_project/data/repository/Popular_repo.dart';
import 'package:ecommerce_project/data/repository/user_sign_repo.dart';
import 'package:ecommerce_project/model/popular_product_model.dart';
import 'package:ecommerce_project/model/product_model.dart';
import 'package:ecommerce_project/model/user_signin_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSignInController extends GetxController {
// create intance for PopularProductRepo class
  final UserSignInRepo userSignInRepo;

// intialize the contructor
  UserSignInController({required this.userSignInRepo});

  Future<void> userSigIn({email, password}) async {
    UserSignInModel userSignInModel =
        UserSignInModel(email: email, password: password);

    var response = await userSignInRepo.userSignin(userSignInModel);
    if (response != null) {
      var data = json.decode(response);
//navigate to home screen

      print(data);
      Get.snackbar('Success', 'User login Successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color.fromARGB(255, 3, 150, 15));
      Get.offAllNamed('/home');
    }
  }
}
