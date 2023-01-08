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

// this is private variable

// to access the data we are using this method

  Future<void> userSigIn({email, password}) async {
    Response response = await userSignInRepo.userSignin();
    print(response.body);
    if (response.statusCode == 200) {
      var userData = UserSignInModel(email: email, password: password);

      //to  get real time data
      update();
    }
  }
}
