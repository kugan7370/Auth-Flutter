import 'dart:convert';

import 'package:ecommerce_project/data/repository/Popular_repo.dart';
import 'package:ecommerce_project/data/repository/user_sign_repo.dart';
import 'package:ecommerce_project/data/repository/user_signup_repo.dart';
import 'package:ecommerce_project/model/popular_product_model.dart';
import 'package:ecommerce_project/model/product_model.dart';
import 'package:ecommerce_project/model/user_sign_up_model.dart';
import 'package:ecommerce_project/model/user_signin_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSignUpController extends GetxController {
// create intance for PopularProductRepo class
  final UserSignUpRepo userSignUpRepo;

// intialize the contructor
  UserSignUpController({required this.userSignUpRepo});

  Future<void> userSignUp({email, password, confirmPassword, username}) async {
    UserSignUpModel userSignUpModel = UserSignUpModel(
        email: email,
        password: password,
        name: username,
        confirmPassword: confirmPassword);

    var response = await userSignUpRepo.userSignUp(userSignUpModel);
    if (response != null) {
//navigate to home screen

      Get.snackbar('Success', 'User Register Successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color.fromARGB(255, 3, 150, 15));
      Get.offAllNamed('/signin');
    }
  }
}
