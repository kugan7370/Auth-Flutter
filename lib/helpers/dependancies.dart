import 'package:ecommerce_project/controller/all_food_controller.dart';
import 'package:ecommerce_project/controller/cart_food_controller.dart';
import 'package:ecommerce_project/controller/popular_product_controller.dart';
import 'package:ecommerce_project/controller/trending_food_controller.dart';
import 'package:ecommerce_project/controller/user_sign_controller.dart';
import 'package:ecommerce_project/controller/user_sign_up_controller.dart';
import 'package:ecommerce_project/data/api/api_client.dart';
import 'package:ecommerce_project/data/repository/Popular_repo.dart';
import 'package:ecommerce_project/data/repository/all_food.dart';
import 'package:ecommerce_project/data/repository/cart_food_repo.dart';
import 'package:ecommerce_project/data/repository/trending_repo.dart';
import 'package:ecommerce_project/data/repository/user_sign_repo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../data/repository/user_signup_repo.dart';

Future<void> init() async {
// api client------------------------------------------------------------------
  Get.lazyPut(() => ApiClient());

  // repos------------------------------------------------------------------------

  //signin repo
  Get.lazyPut(() => UserSignInRepo(apiClient: Get.find()));

  //signup repo
  Get.lazyPut(() => UserSignUpRepo(apiClient: Get.find()));

  //all food repo
  Get.lazyPut(() => AllFoodRepo(apiClient: Get.find()));

  //popular food repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // trending food repo
  Get.lazyPut(() => TrendingRepo(apiClient: Get.find()));

  //cart repo
  Get.lazyPut(() => CartRepo(apiClient: Get.find()));

  //controllers------------------------------------------------------------------

  //all food controller
  Get.lazyPut(() => AllFoodController(allFoodRepo: Get.find()));

  // popular food controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));

  // trending food controller
  Get.lazyPut(() => TrendingFoodController(trendingRepo: Get.find()));

  //cart controller
  Get.lazyPut(() => CartController(cartRepo: Get.find()));

  //user sign in controller
  Get.lazyPut(() => UserSignInController(userSignInRepo: Get.find()));

  //user sign up controller
  Get.lazyPut(() => UserSignUpController(userSignUpRepo: Get.find()));
}
