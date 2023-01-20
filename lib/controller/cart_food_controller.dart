//cart controller
import 'dart:convert';

import 'package:ecommerce_project/controller/cart_food_controller.dart';
import 'package:ecommerce_project/data/repository/cart_food_repo.dart';
import 'package:ecommerce_project/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  List<dynamic> _addCartList = [];

  //add product into cart
  Future<void> addToCart(data, int quantity) async {
    CartModel cartModel = CartModel(
      foodId: data.id,
      name: data.name,
      quantity: quantity,
      price: data.price,
      image: data.image,
    );

    _addCartList.clear();
    _addCartList.add(cartModel);
    update();

    var response = await cartRepo.addToCart(data: _addCartList);

    if (response != null) {
      var data = json.decode(response);

      Get.snackbar('Success', data["message"],
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: const Color.fromARGB(255, 3, 150, 15));
    }
  }

  //get all cart item
  List<dynamic> _cartList = [];

  List<dynamic> get cartList => _cartList;

  Future<void> getAllCartList() async {
    var response = await cartRepo.getAllCartList();

    if (response != null) {
      _cartList = [];
      _cartList.addAll(jsonDecode(response)["data"]
          .map((item) => CartModel.fromJson(item))
          .toList());

      //to  get real time data
      update();
    }
  }
}
